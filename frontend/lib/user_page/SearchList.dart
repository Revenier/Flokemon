import 'dart:core';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:frontend/admin_page/CreatePoke.dart';
// import 'package:frontend/admin_page/CreatePokeList.dart';
import 'package:frontend/both/PokeStat.dart';

import '../both/PokeStat.dart';

class element_list extends StatefulWidget {
  final List<dynamic> profile;
  final List<CreatePoke> displayList;
  final String element;
  const element_list(
      {Key? key,
      required this.profile,
      required this.displayList,
      required this.element})
      : super(key: key);

  @override
  State<element_list> createState() => _element_listState();
}

class _element_listState extends State<element_list> {
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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.element,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 20.0, left: 15.0, right: 15.0, bottom: 15.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: width / (width * 1.25),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: widget.displayList.length,
          itemBuilder: (context, index) {
            var data = widget.displayList[index];
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
                      pokeList: widget.displayList[index],
                      profile: widget.profile,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
