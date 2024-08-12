import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/admin_page/CreatePoke.dart';
import 'package:http/http.dart' as http;

class test1 extends StatefulWidget {
  const test1({super.key});

  @override
  State<test1> createState() => _test1State();
}

class _test1State extends State<test1> {
  late Future<List<CreatePoke>> pokeList;

  Future<List<CreatePoke>> fetchPokeList() async {
    String url = "http://10.0.2.2:8080/users/viewallpokemon";

    var resp = await http.get(Uri.parse(url));

    var result = jsonDecode(resp.body);

    print(result);

    List<CreatePoke> pokeList = [];

    for (var i in result) {
      CreatePoke fetchPokeList = CreatePoke.fromJson(i);
      pokeList.add(fetchPokeList);
    }

    return pokeList;
  }

  @override
  void initState() {
    super.initState();
    pokeList = fetchPokeList();
    print(pokeList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 100,
        // color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: FutureBuilder(
              future: pokeList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Return a loading indicator or placeholder widget
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // Handle the error case
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.data == null) {
                  // Handle the case where the data is null
                  return Text('Data is null');
                } else {
                  // The data has been successfully fetched
                  var data = snapshot.data as List<CreatePoke>;

                  return ListView(
                    children: data
                        .map(
                          (e) => Card(
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              leading: Image.asset(e.Image_directory),
                              title: Text(e.Poke_name),
                            ),
                          ),
                        )
                        .toList(),
                  );
                }
              },
            )),
      ),
    );
  }
}
