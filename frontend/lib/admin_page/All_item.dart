import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:frontend/admin_page/CreatePoke.dart';
import 'package:frontend/both/PokeStat.dart';

class all_item extends StatefulWidget {
  final List<dynamic> profile;
  const all_item({Key? key, required this.profile}) : super(key: key);

  @override
  State<all_item> createState() => _all_itemState();
}

class _all_itemState extends State<all_item> {
  TextEditingController searchController = TextEditingController();
  String token = "";
  late Future<List<CreatePoke>> pokeList;
  late List<CreatePoke> _pokeList = []; // Initialize _pokeList
  List<CreatePoke> displayList = [];

  @override
  void initState() {
    super.initState();
    for (dynamic element in widget.profile) {
      token = element['token'];
    }
    pokeList = fetchPokeList(token);
    pokeList.then((list) {
      setState(() {
        _pokeList = list;
        displayList = list;
      });
    });
  }

  logo1(double width, CreatePoke poke) {
    if (poke.Element1_directory == 'bug') {
      return Image.asset('assets/Element/bug.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element1_directory.toLowerCase() == 'dark') {
      return Image.asset('assets/Element/dark.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element1_directory.toLowerCase() == 'dragon') {
      return Image.asset('assets/Element/dragon.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element1_directory.toLowerCase() == 'electric') {
      return Image.asset('assets/Element/electric.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element1_directory.toLowerCase() == 'fairy') {
      return Image.asset('assets/Element/fairy.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element1_directory.toLowerCase() == 'fighting') {
      return Image.asset('assets/Element/fighting.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element1_directory.toLowerCase() == 'fire') {
      return Image.asset('assets/Element/fire.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element1_directory.toLowerCase() == 'flying') {
      return Image.asset('assets/Element/flying.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element1_directory.toLowerCase() == 'ghost') {
      return Image.asset('assets/Element/ghost.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element1_directory.toLowerCase() == 'grass') {
      return Image.asset('assets/Element/grass.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element1_directory.toLowerCase() == 'ground') {
      return Image.asset('assets/Element/ground.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element1_directory.toLowerCase() == 'ice') {
      return Image.asset('assets/Element/ice.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element1_directory.toLowerCase() == 'normal') {
      return Image.asset('assets/Element/normal.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element1_directory.toLowerCase() == 'poison') {
      return Image.asset('assets/Element/poison.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element1_directory.toLowerCase() == 'psychic') {
      return Image.asset('assets/Element/psychic.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element1_directory.toLowerCase() == 'rock') {
      return Image.asset('assets/Element/rock.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element1_directory.toLowerCase() == 'steel') {
      return Image.asset('assets/Element/steel.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element1_directory.toLowerCase() == 'water') {
      return Image.asset('assets/Element/water.png',
          height: width * 0.05, width: width * 0.05);
    } else
      return Container();
  }

  logo2(double width, CreatePoke poke) {
    // CreatePoke poke = displayList[index];

    if (poke.Element2_directory.toLowerCase() == 'bug') {
      return Image.asset('assets/Element/bug.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element2_directory.toLowerCase() == 'dark') {
      return Image.asset('assets/Element/dark.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element2_directory.toLowerCase() == 'dragon') {
      return Image.asset('assets/Element/dragon.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element2_directory.toLowerCase() == 'electric') {
      return Image.asset('assets/Element/electric.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element2_directory.toLowerCase() == 'fairy') {
      return Image.asset('assets/Element/fairy.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element2_directory.toLowerCase() == 'fighting') {
      return Image.asset('assets/Element/fighting.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element2_directory.toLowerCase() == 'fire') {
      return Image.asset('assets/Element/fire.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element2_directory.toLowerCase() == 'flying') {
      return Image.asset('assets/Element/flying.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element2_directory.toLowerCase() == 'ghost') {
      return Image.asset('assets/Element/ghost.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element2_directory.toLowerCase() == 'grass') {
      return Image.asset('assets/Element/grass.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element2_directory.toLowerCase() == 'ground') {
      return Image.asset('assets/Element/ground.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element2_directory.toLowerCase() == 'ice') {
      return Image.asset('assets/Element/ice.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element2_directory.toLowerCase() == 'normal') {
      return Image.asset('assets/Element/normal.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element2_directory.toLowerCase() == 'poison') {
      return Image.asset('assets/Element/poison.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element2_directory.toLowerCase() == 'psychic') {
      return Image.asset('assets/Element/psychic.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element2_directory.toLowerCase() == 'rock') {
      return Image.asset('assets/Element/rock.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element2_directory.toLowerCase() == 'steel') {
      return Image.asset('assets/Element/steel.png',
          height: width * 0.05, width: width * 0.05);
    } else if (poke.Element2_directory.toLowerCase() == 'steel') {
      return Image.asset('assets/Element/water.png',
          height: width * 0.05, width: width * 0.05);
    } else {
      return Container();
    }
  }

  void searchPokeList(String value) {
    List<CreatePoke> searchList = _pokeList.where((poke) {
      return poke.Poke_name.toLowerCase().contains(value.toLowerCase()) ||
          poke.Poke_index.toString().contains(value);
    }).toList();

    setState(() {
      displayList = searchList;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "ALL ITEM",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onChanged: (value) => searchPokeList(value),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                suffixIcon: const Icon(Icons.search),
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: width / (width * 1.25),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: displayList.length,
                itemBuilder: (context, index) {
                  var data = displayList[index];
                  return GestureDetector(
                    child: Container(
                      height: width * 0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(5, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: height * 0.01),
                          Row(
                            children: [
                              SizedBox(
                                height: height * 0.02,
                                width: width * 0.03,
                              ),
                              Text(
                                '${data.Poke_index}'.padLeft(4, '0'),
                                style: const TextStyle(fontSize: 14),
                              ),
                              if (data.Element2_directory == 'none') ...[
                                SizedBox(
                                  width: width * 0.095,
                                ),
                                logo1(width, data),
                              ],
                              if (data.Element2_directory != 'none') ...[
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                logo1(width, data),
                                logo2(width, data)
                              ]
                            ],
                          ),
                          SizedBox(
                            height: height * 0.005,
                          ),
                          Image.network(
                            data.Image_directory,
                            height: width * 0.2,
                            width: width * 0.2,
                          ),
                          SizedBox(
                            height: height * 0.005,
                          ),
                          AutoSizeText(
                            data.Poke_name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PokeStat(
                            collect: 0,
                            pokeList: displayList[index],
                            profile: widget.profile,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
