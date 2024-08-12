import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:frontend/admin_page/CreatePoke.dart';
import 'package:frontend/both/TransactionListCreate.dart';

class History extends StatefulWidget {
  late List<dynamic> profile;
  History({Key? key, required this.profile}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  late Future<List<CreateTransaction>> historyList;
  late List<CreateTransaction> _historyList = []; // Initialize _pokeList
  late String username;
  int realtotal = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (dynamic element in widget.profile) {
      // Access values from each map in the list
      username = element['username'];
    }
    historyList = fetchHistoryList(username);
    historyList.then((list) {
      setState(() {
        _historyList = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "HISTORY",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: _historyList.length,
                itemBuilder: (context, index) => Container(
                  width: width,
                  height: height * 0.09,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(5, 5))
                    ],
                  ),
                  child: ListTile(
                    leading:
                        Image.network(_historyList[index].Image_directory!),
                    title: Text(_historyList[index].Poke_name!),
                    subtitle: Text('Quantity= ${_historyList[index].quantity}'),
                    trailing: Text(
                      '\$${_historyList[index].total_price * _historyList[index].quantity}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
