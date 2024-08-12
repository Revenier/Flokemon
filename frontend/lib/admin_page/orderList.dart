import 'package:flutter/material.dart';
import 'package:frontend/both/TransactionListCreate.dart';

class order_list extends StatefulWidget {
  final List<dynamic> profile;
  const order_list({super.key, required this.profile});

  @override
  State<order_list> createState() => _order_listState();
}

class _order_listState extends State<order_list> {
  late Future<List<CreateTransaction>> historyList;
  late List<CreateTransaction> _historyList = []; // Initialize _pokeList
  String token = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (dynamic element in widget.profile) {
      token = element['token'];
    }
    historyList = fetchTransactionList(token);

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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "ORDER LIST",
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
                    title: Container(
                        width: width * 0.2,
                        // color: Colors.amber,
                        child: Text(
                          '${_historyList[index].nama_user}',
                          style: TextStyle(fontSize: 15),
                        )),
                    subtitle: Text(
                      'Total Price: ${_historyList[index].total_price}',
                      style: TextStyle(fontSize: 15),
                    ),
                    trailing: Column(
                      children: [
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Text(_historyList[index].Poke_name!),
                        Text('Quantity= ${_historyList[index].quantity}'),
                      ],
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
