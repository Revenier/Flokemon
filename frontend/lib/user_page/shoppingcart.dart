import 'dart:convert';
import 'dart:ffi';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:frontend/admin_page/CreatePoke.dart';
import 'package:frontend/user_page/CartList.dart';
import 'package:http/http.dart' as http;

class shopping_cart extends StatefulWidget {
  final List<dynamic> profile;
  const shopping_cart({Key? key, required this.profile}) : super(key: key);

  @override
  State<shopping_cart> createState() => _shopping_cartState();
}

class _shopping_cartState extends State<shopping_cart> {
  late List<dynamic> profile1;
  String email = "";

  void initState() {
    // TODO: implement initState
    super.initState();
    for (dynamic element in widget.profile) {
      // Access values from each map in the list
      email = element['email'];
    }
  }

  CartList cartListcall = CartList();
  Set<int> selectedIndices = Set<int>();
  bool selectAll = false;
  double TotalPrice = 0;
  Map<int, int> itemQuantities = {
    0: 0
  }; // Map to store quantities for each item

  void updateTotalPrice() {
    TotalPrice = selectedIndices.fold(
      0.0,
      (sum, index) {
        if (itemQuantities.containsKey(index)) {
          return sum +
              (cartListcall.displayCart[index].Poke_price *
                  itemQuantities[index]!);
        }
        return sum;
      },
    );
  }

  Future<void> buyPokemon(int index) async {
    String url = "http://10.0.2.2:8080/users/buypokemon";
    int pokeId = cartListcall.displayCart[index].Poke_index;
    int quantity = itemQuantities[index]!;

    String json =
        jsonEncode({"useremail": email, "id": pokeId, "quantity": quantity});

    final resp = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: json);

    try {
      final response = await http.post(Uri.parse(url), body: json);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Purchase Succesful!'),
          ),
        );
      }
    } catch (e) {
      // Handle network or other errors
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Purchase Failed (Unexpected Error)'),
        ),
      );
    }

    return;
  }

  late List<CreatePoke> tempList;
  void removeSelectedItems() {
    tempList = List.from(cartListcall.displayCart);

    // Remove selected items from the tempList
    tempList.removeWhere((item) =>
        selectedIndices.contains(cartListcall.displayCart.indexOf(item)));

    // Update the displayList with the modified tempList
    setState(() {
      cartListcall.displayCart = tempList;
      // Clear the selectedIndices and update total price
      selectedIndices.clear();
      updateTotalPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(selectedIndices);
    // print(cartListcall.displayCart[cartListcall.displayCart.length - 1].Poke_index);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text(
          "CART",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                  left: 25, right: 25, top: 10, bottom: 0),
              child: ListView.builder(
                itemCount: cartListcall.displayCart.length,
                itemBuilder: (context, index) => Container(
                    width: width,
                    height: height * 0.14,
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
                        contentPadding: const EdgeInsets.only(
                          top: 20,
                          left: 10,
                          bottom: 10,
                          right: 10,
                        ),
                        leading: Image.network(
                            cartListcall.displayCart[index].Image_directory),
                        title: Text(cartListcall.displayCart[index].Poke_name),
                        subtitle: Text(
                            'USD ${cartListcall.displayCart[index].Poke_price}'),
                        iconColor: Colors.black,
                        trailing: Container(
                          width: 130,
                          child: FittedBox(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        if (itemQuantities.containsKey(index) &&
                                            itemQuantities[index]! > 0) {
                                          itemQuantities[index] =
                                              itemQuantities[index]! - 1;
                                          if (selectedIndices
                                              .contains((index))) {
                                            updateTotalPrice();
                                          }
                                        }
                                      });
                                    }),
                                Text(itemQuantities.containsKey(index)
                                    ? itemQuantities[index].toString()
                                    : '0'),
                                IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        itemQuantities[index] =
                                            (itemQuantities[index] ?? 0) + 1;
                                        if (selectedIndices.contains((index))) {
                                          updateTotalPrice();
                                        }
                                      });
                                    }),
                                Checkbox(
                                    value: selectedIndices.contains(index) ||
                                        selectAll,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        if (newValue != null) {
                                          if (newValue) {
                                            selectedIndices.add(index);
                                          } else {
                                            selectedIndices.remove(index);
                                          }
                                        }
                                        updateTotalPrice();
                                        selectAll = false;
                                      });
                                    }),
                              ],
                            ),
                          ),
                        ))),
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(right: 10, left: 10, bottom: 20, top: 0),
            width: width,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(5, 5)),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 100),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Total: USD ${TotalPrice} ',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 1),
                  child: Divider(
                    height: 20,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.grey[300],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 5, bottom: 5, left: 20),
                      child: Checkbox(
                        value: selectAll,
                        onChanged: (bool? newValue) {
                          setState(() {
                            selectAll = newValue ?? false;
                            if (selectAll) {
                              // If "Select All" is checked, select all items
                              selectedIndices = Set<int>.from((List.generate(
                                  cartListcall.displayCart.length,
                                  (index) => index)));
                            } else {
                              // If "Select All" is unchecked, clear all selections
                              selectedIndices.clear();
                              // TotalPrice= 0;
                            }
                            updateTotalPrice();
                          });
                        },
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        child: const FittedBox(child: Text("SELECT ALL"))),
                    SizedBox(width: width * 0.12),
                    GestureDetector(
                      child: Container(
                          width: width * 0.4,
                          height: height * 0.05,
                          decoration: BoxDecoration(
                            color: Colors.yellow[700],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                              margin: const EdgeInsets.all(6.5),
                              child: const FittedBox(
                                  child: Text(
                                "CHECK OUT",
                              )))),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Are you sure to check out?'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      for (var i in selectedIndices) {
                                        await buyPokemon(i);
                                      }

                                      removeSelectedItems();

                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Yes'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Close the dialog without performing any action
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('No'),
                                  ),
                                ],
                              );
                            });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
