import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:http/http.dart' as http;

class addItem extends StatefulWidget {
  const addItem({super.key});

  @override
  State<addItem> createState() => _addItemState();
}

class _addItemState extends State<addItem> {
  var pokeNameController = TextEditingController();
  var pokeIDController = TextEditingController();
  var pokeDescController = TextEditingController();
  var heightController = TextEditingController();
  var weightController = TextEditingController();
  var priceController = TextEditingController();
  int pokeHeight = 0;
  int pokeWeight = 0;
  int pokePrice = 0;
  @override
  void createSnackBar(String textshown) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(textshown),
      ),
    );
  }

  void _addPokemonOnPressed(BuildContext context) async {
    if (pokeNameController.text.isEmpty ||
        heightController.text.isEmpty ||
        weightController.text.isEmpty ||
        heightController.text.isEmpty ||
        priceController.text.isEmpty ||
        pokeDescController.text.isEmpty) {
      createSnackBar('Please all the data needed!');
    } else {
      pokeHeight = int.parse(heightController.text)!;
      pokeWeight = int.parse(weightController.text)!;
      pokePrice = int.parse(priceController.text)!;

      // Add pokemon ke database
      String url = "http://10.0.2.2:8080/users/addpokemon";
      String json = jsonEncode({
        "id": pokeIDController.text,
        "name": pokeNameController.text,
        "type1": selectedValue1,
        "type2": selectedValue2,
        "height": pokeHeight,
        "weight": pokeWeight,
        "description": pokeDescController.text,
        "price": pokePrice,
      });
      final resp = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"}, body: json);
      if (resp.statusCode == 200) {
        createSnackBar('Successful in adding pokemon!');
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => super.widget));
      }
    }
  }

  String? selectedValue1;
  String? selectedValue2;
  final List<String> _element1 = [
    'Normal',
    'Fire',
    'Water',
    'Electric',
    'Ice',
    'Grass',
    'Ground',
    'Dark',
    'Poison',
    'Fighting',
    'Psychic',
    'Bug',
    'Dragon',
    'Fairy',
    'Flying',
    'Ghost',
    'Rock',
    'Steel',
  ];

  final List<String> _element2 = [
    'None',
    'Normal',
    'Fire',
    'Water',
    'Electric',
    'Ice',
    'Grass',
    'Ground',
    'Dark',
    'Poison',
    'Fighting',
    'Psychic',
    'Bug',
    'Dragon',
    'Fairy',
    'Flying',
    'Ghost',
    'Rock',
    'Steel',
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "ADD ITEM",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              // --> Pokemon ID
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: width * 0.01),
                    // color: Colors.amber,
                    child: Text(
                      "POKEMON ID",
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(3, 3))
                  ],
                ),
                child: TextFormField(
                  controller: pokeIDController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 198, 198, 198)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: height * 0.01, horizontal: width * 0.03)),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),

              // --> Pokemon Name -----------------------------------------------------------
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: width * 0.01),
                    // color: Colors.amber,
                    child: Text(
                      "POKEMON NAME",
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(3, 3))
                  ],
                ),
                //Pokemon Name
                child: TextFormField(
                  controller: pokeNameController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 198, 198, 198)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: height * 0.01, horizontal: width * 0.03)),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),

              // --> Element 1 & 2 -----------------------------------------------------------
              Row(
                // --> element 1
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                            child: Text(
                              "FIRST ELEMENT",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black87),
                            ),
                          ),
                        ),
                        Center(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: Text(
                                'Select',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: _element1
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ))
                                  .toList(),
                              value: selectedValue1,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedValue1 = value;
                                });
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                height: 40,
                                width: 200,
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 50,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: 250,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width * 0.08,
                  ),

                  // --> Element 2
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                            child: Text(
                              "SECOND ELEMENT",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black87),
                            ),
                          ),
                        ),
                        Center(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: Text(
                                'Select',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: _element2
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ))
                                  .toList(),
                              value: selectedValue2,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedValue2 = value;
                                });
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                height: 40,
                                width: 200,
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 50,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: 250,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),

              // --> Height -----------------------------------------------------------
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
                            child: Text(
                              "Height",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black87),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: const Offset(3, 3))
                            ],
                          ),
                          child: TextFormField(
                            controller: heightController,
                            decoration: InputDecoration(
                                // hintText: 'input pokemon name',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 198, 198, 198)),
                                  // borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: height * 0.01,
                                    horizontal: width * 0.03)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width * 0.08,
                  ),
                  // --> Weight -----------------------------------------------------------
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
                            child: Text(
                              "Weight",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black87),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: const Offset(3, 3))
                            ],
                          ),
                          child: TextFormField(
                            controller: weightController,
                            decoration: InputDecoration(
                                // hintText: 'input pokemon name',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 198, 198, 198)),
                                  // borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: height * 0.01,
                                    horizontal: width * 0.03)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),

              //--> Description ------------------------------------------------------------
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: width * 0.7),
                    child: Text(
                      "Description",
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(3, 3))
                      ],
                    ),
                    child: TextFormField(
                      controller: pokeDescController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 198, 198, 198)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: height * 0.01, horizontal: width * 0.03),
                      ),
                      maxLines: 5,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),

              // --> Price ---------------------------------------------------------------------
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: width * 0.01),
                    // color: Colors.amber,
                    child: Text(
                      "Price",
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(3, 3))
                  ],
                ),
                child: TextFormField(
                  controller: priceController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 198, 198, 198)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: height * 0.01, horizontal: width * 0.03)),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),

              // --> Image Link input  ---------------------------------------------------------------------
              //  Row(
              //   children: [
              //     Container(
              //       margin: EdgeInsets.only(left: width*0.01),
              //       // color: Colors.amber,
              //       child: Text("Image link", style: TextStyle(fontSize: 15, color: Colors.black87),),
              //     ),
              //   ],
              // ),
              // SizedBox(height: height*0.01),
              // Container(
              //   decoration: BoxDecoration(
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.black.withOpacity(0.1),
              //           spreadRadius: 2,
              //           blurRadius: 2,
              //           offset: const Offset(3, 3)
              //         )
              //       ],
              //     ),
              //     child: TextFormField(
              //       decoration: InputDecoration(
              //         enabledBorder: OutlineInputBorder(
              //           borderSide: BorderSide(color: Color.fromARGB(255, 198, 198, 198)),
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //           borderSide: BorderSide(color: Colors.grey.shade400),
              //         ),
              //         fillColor: Colors.white,filled: true,
              //         contentPadding: EdgeInsets.symmetric(vertical: height*0.01, horizontal: width*0.03)
              //       ),
              //     ),
              // ),
              SizedBox(
                height: height * 0.02,
              ),
              ElevatedButton(
                onPressed: () => _addPokemonOnPressed(context),
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
