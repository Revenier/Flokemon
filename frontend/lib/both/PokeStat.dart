import 'package:flutter/material.dart';
import 'package:frontend/admin_page/CreatePoke.dart';
import 'package:frontend/both/TransactionListCreate.dart';
// import 'package:frontend/admin_page/CreatePokeList.dart';
import 'package:frontend/user_page/CartList.dart';

import '../admin_page/edit_poke.dart';

class PokeStat extends StatefulWidget {
  final int collect;
  final CreatePoke pokeList;
  final List<dynamic> profile;
  const PokeStat(
      {Key? key,
      required this.collect,
      required this.pokeList,
      required this.profile})
      : super(key: key);
  @override
  State<PokeStat> createState() => _PokeStatState();
}

class _PokeStatState extends State<PokeStat> {
  late String username;
  late Future<List<CreateTransaction>> historyList;
  List<CreateTransaction> _historyList = [];
  int quantity = 0;

  @override
  void initState() {
    super.initState();
    for (dynamic element in widget.profile) {
      // Access values from each map in the list
      username = element['username'];
    }
    historyList = fetchHistoryList(username);
    historyList.then((list) {
      setState(() {
        _historyList = list;
        cekquantity();
      });
    });
  } // Initialize _pokeList

  void cekquantity() {
    for (var i in _historyList) {
      if (i.Poke_name == widget.pokeList.Poke_name) {
        quantity = quantity + i.quantity!;
      }
    }
  }

  warna1(int index) {
    if (widget.pokeList.Element1_directory.toLowerCase() == 'bug') {
      return Colors.lightGreen;
    } else if (widget.pokeList.Element1_directory.toLowerCase() == 'dark') {
      return Colors.black87;
    } else if (widget.pokeList.Element1_directory.toLowerCase() == 'dragon') {
      return const Color.fromARGB(255, 89, 220, 156);
    } else if (widget.pokeList.Element1_directory.toLowerCase() == 'Electric') {
      return Colors.orangeAccent;
    } else if (widget.pokeList.Element1_directory.toLowerCase() == 'fairy') {
      return Colors.pink;
    } else if (widget.pokeList.Element1_directory.toLowerCase() == 'fighting') {
      return Colors.deepOrangeAccent;
    } else if (widget.pokeList.Element1_directory.toLowerCase() == 'fire') {
      return Colors.redAccent;
    } else if (widget.pokeList.Element1_directory.toLowerCase() == 'flying') {
      return Colors.indigoAccent;
    } else if (widget.pokeList.Element1_directory.toLowerCase() == 'ghost') {
      return Colors.black87;
    } else if (widget.pokeList.Element1_directory.toLowerCase() == 'grass') {
      return Colors.green;
    } else if (widget.pokeList.Element1_directory.toLowerCase() == 'ground') {
      return Colors.brown;
    } else if (widget.pokeList.Element1_directory.toLowerCase() == 'ice') {
      return Colors.blueAccent;
    } else if (widget.pokeList.Element1_directory.toLowerCase() == 'normal') {
      return Colors.black87;
    } else if (widget.pokeList.Element1_directory.toLowerCase() == 'poison') {
      return Colors.purple;
    } else if (widget.pokeList.Element1_directory.toLowerCase() == 'psychic') {
      return Colors.indigo;
    } else if (widget.pokeList.Element1_directory.toLowerCase() == 'rock') {
      return Colors.brown;
    } else if (widget.pokeList.Element1_directory.toLowerCase() == 'steel') {
      return Colors.grey;
    } else {
      return Colors.lightBlueAccent;
    }
  }

  warna2(int index) {
    if (widget.pokeList.Element2_directory.toLowerCase() == 'bug') {
      return Colors.lightGreen;
    } else if (widget.pokeList.Element2_directory.toLowerCase() == 'dark') {
      return Colors.black87;
    } else if (widget.pokeList.Element2_directory.toLowerCase() == 'dragon') {
      return Colors.greenAccent;
    } else if (widget.pokeList.Element2_directory.toLowerCase() == 'Electric') {
      return Colors.orangeAccent;
    } else if (widget.pokeList.Element2_directory.toLowerCase() == 'fairy') {
      return Colors.pink;
    } else if (widget.pokeList.Element2_directory.toLowerCase() == 'fighting') {
      return Colors.deepOrangeAccent;
    } else if (widget.pokeList.Element2_directory.toLowerCase() == 'fire') {
      return Colors.redAccent;
    } else if (widget.pokeList.Element2_directory.toLowerCase() == 'flying') {
      return Colors.indigoAccent;
    } else if (widget.pokeList.Element2_directory.toLowerCase() == 'ghost') {
      return Colors.black87;
    } else if (widget.pokeList.Element2_directory.toLowerCase() == 'grass') {
      return Colors.green;
    } else if (widget.pokeList.Element2_directory.toLowerCase() == 'ground') {
      return Colors.brown;
    } else if (widget.pokeList.Element2_directory.toLowerCase() == 'ice') {
      return Colors.blueAccent;
    } else if (widget.pokeList.Element2_directory.toLowerCase() == 'normal') {
      return Colors.black87;
    } else if (widget.pokeList.Element2_directory.toLowerCase() == 'poison') {
      return Colors.purple;
    } else if (widget.pokeList.Element2_directory.toLowerCase() == 'psychic') {
      return Colors.indigo;
    } else if (widget.pokeList.Element2_directory.toLowerCase() == 'rock') {
      return Colors.brown;
    } else if (widget.pokeList.Element2_directory.toLowerCase() == 'steel') {
      return Colors.grey;
    } else {
      return Colors.lightBlueAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    late int accountStats;
    for (dynamic element in widget.profile) {
      // Access values from each map in the list
      accountStats = element['accountstatus'];
    }
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            widget.pokeList.Poke_name,
            style: const TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 90,
                  height: 30,
                  decoration: BoxDecoration(
                      color: warna1(0),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.pokeList.Element1_directory.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                if (widget.pokeList.Element2_directory?.toLowerCase() !=
                    'none') ...[
                  const SizedBox(width: 20),
                  Container(
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                        color: warna2(0),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.pokeList.Element2_directory.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ]
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              width: width * 0.6,
              height: width * 0.6,
              child: Image.network(
                widget.pokeList.Image_directory,
                height: 100,
                width: 100,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                width: 300,
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Height: ${widget.pokeList.Height_poke}',
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Weight: ${widget.pokeList.Weight_poke}',
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Container(
                      child: Text(
                    widget.pokeList.Desc_poke.toString(),
                    textAlign: TextAlign.center,
                  )),
                ]),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            if (widget.collect == 0)
              Text(
                'Price : \$${widget.pokeList.Poke_price}',
                style: const TextStyle(fontSize: 20),
              ),
            if (widget.collect == 1)
              Text(
                'Quantity : $quantity',
                style: const TextStyle(fontSize: 20),
              ),
            SizedBox(
              height: height * 0.04,
            ),
            if (widget.collect == 0) ...[
              GestureDetector(
                child: Container(
                  width: 250,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.yellow[700],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: (accountStats == 0)
                      ? Container(
                          margin: EdgeInsets.only(top: height * 0.005),
                          child: const Text(
                            "EDIT",
                            style: TextStyle(fontSize: 30),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : const Icon(Icons.shopping_cart, size: 35),
                ),
                onTap: () {
                  if (accountStats == 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => editPoke(
                                  pokeList: widget.pokeList,
                                  profile: widget.profile,
                                )));
                  } else if (accountStats == 1) {
                    CreatePoke item = widget.pokeList;
                    CartList().addItemToCart(item);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${item.Poke_name} added to the cart.'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                },
              ),
            ]
          ],
        ));
  }
}
