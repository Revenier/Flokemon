import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:frontend/admin_page/CreatePoke.dart';
import 'package:frontend/admin_page/navBarAdmin.dart';

import 'package:http/http.dart' as http;

class editPoke extends StatefulWidget {
  final CreatePoke pokeList;
  final List<dynamic> profile;
  const editPoke({Key? key, required this.pokeList, required this.profile})
      : super(key: key);

  @override
  State<editPoke> createState() => _editPokeState();
}

class _editPokeState extends State<editPoke> {
  var pokeNameController = TextEditingController();
  var pokeIDController = TextEditingController();
  var pokeDescController = TextEditingController();
  var heightController = TextEditingController();
  var weightController = TextEditingController();
  var priceController = TextEditingController();
  String? selectedValue1;
  String? selectedValue2;
  int pokeHeight = 0;
  int pokeWeight = 0;
  int pokePrice = 0;

  void createSnackBar(String textshown) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(textshown),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pokeNameController = TextEditingController(text: widget.pokeList.Poke_name);
    pokeIDController =
        TextEditingController(text: widget.pokeList.Poke_index.toString());
    pokeDescController = TextEditingController(text: widget.pokeList.Desc_poke);
    heightController =
        TextEditingController(text: widget.pokeList.Height_poke.toString());
    weightController =
        TextEditingController(text: widget.pokeList.Weight_poke.toString());
    priceController =
        TextEditingController(text: widget.pokeList.Poke_price.toString());

    setState(() {
      selectedValue1 = widget.pokeList.Element1_directory[0].toUpperCase() +
          widget.pokeList.Element1_directory.substring(1);
      selectedValue2 = widget.pokeList.Element2_directory[0].toUpperCase() +
          widget.pokeList.Element2_directory.substring(1);
    });
  }

  void _updatePokemonOnPressed(BuildContext context) async {
    if (pokeNameController.text.isEmpty ||
        heightController.text.isEmpty ||
        weightController.text.isEmpty ||
        heightController.text.isEmpty ||
        priceController.text.isEmpty ||
        pokeDescController.text.isEmpty ||
        selectedValue1 == null ||
        selectedValue2 == null) {
      createSnackBar('Please input all the data needed!');
    } else {
      pokeHeight = int.parse(heightController.text)!;
      pokeWeight = int.parse(weightController.text)!;
      pokePrice = int.parse(priceController.text)!;
      selectedValue1 = selectedValue1!.toLowerCase();
      selectedValue2 = selectedValue2!.toLowerCase();
      // Add pokemon ke database
      String url = "http://10.0.2.2:8080/users/editpokemon";
      String json = jsonEncode({
        "pokeid": pokeIDController.text,
        "pokename": pokeNameController.text,
        "type1": selectedValue1,
        "type2": selectedValue2,
        "height": pokeHeight,
        "weight": pokeWeight,
        "description": pokeDescController.text,
        "price": pokePrice,
        "oldid": widget.pokeList.Poke_index
      });
      final resp = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"}, body: json);
      if (resp.statusCode == 200) {
        createSnackBar('Successful in updating pokemon!');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NavBarAdmin(profile: widget.profile)));
      }
    }
  }

  void _deletePokemonOnPressed(BuildContext context) async {
    String url = "http://10.0.2.2:8080/users/deletepokemon";
    String json = jsonEncode({"id": widget.pokeList.Poke_index});
    final resp = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: json);
    if (resp.statusCode == 200) {
      createSnackBar('Pokemon Deleted!');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NavBarAdmin(profile: widget.profile)));
    }
  }

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "EDIT ITEM",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
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
                            // controller: _nameController,
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

              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          width: width * 0.3,
                          child: ElevatedButton(
                            onPressed: () => _updatePokemonOnPressed(context),
                            child: Text('Done'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          width: width * 0.3,
                          child: ElevatedButton(
                            onPressed: () => _deletePokemonOnPressed(context),
                            child: Text('Delete'),
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Color.fromARGB(255, 176, 57, 49)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
