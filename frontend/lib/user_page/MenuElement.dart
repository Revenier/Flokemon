import 'package:flutter/material.dart';
import 'package:frontend/admin_page/CreatePoke.dart';
import 'package:frontend/user_page/SearchList.dart';

class Menu_Element extends StatefulWidget {
  final List<dynamic> profile;
  const Menu_Element({Key? key, required this.profile}) : super(key: key);
  @override
  State<Menu_Element> createState() => _Menu_ElementState();
}

class _Menu_ElementState extends State<Menu_Element> {
  String token = "";
  late Future<List<CreatePoke>> pokeList;
  late List<CreatePoke> _pokeList;
  List<CreatePoke> displayList = [];

  @override
  void initState() {
    for (dynamic element in widget.profile) {
      token = element['token'];
    }
    super.initState();
    pokeList = fetchPokeList(token);
    pokeList.then((list) {
      setState(() {
        _pokeList = list;
        displayList = list;
      });
    });
  }

  void FilterPokeList(String values) {
    List<CreatePoke> searchList = _pokeList.where((poke) {
      return poke.Element1_directory.toLowerCase()
              .contains(values.toLowerCase()) ||
          poke.Element2_directory.toString().contains(values);
    }).toList();

    setState(() {
      displayList = searchList;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: height * 0.05,
            left: height * 0.001,
            right: height * 0.001,
            bottom: height * 0.01,
          ),
          width: width * 1.5,
          height: height * 0.5,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: SizedBox(
              width: width * 0.8,
              height: height * 0.6,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: width / (width * 0.25),
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15),
                children: [
                  // NORMAL
                  GestureDetector(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(5, 5))
                            ]),
                        child: Row(children: [
                          SizedBox(width: width * 0.055),
                          Text(
                            "NORMAL",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                        ])),
                    onTap: () {
                      FilterPokeList('normal');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => element_list(
                                    profile: widget.profile,
                                    displayList: displayList,
                                    element: 'NORMAL',
                                  )));
                    },
                  ),
                  //FIRE
                  GestureDetector(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(5, 5))
                            ]),
                        child: Row(children: [
                          SizedBox(width: width * 0.055),
                          Text(
                            "FIRE",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent),
                          ),
                        ])),
                    onTap: () {
                      FilterPokeList('fire');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => element_list(
                                    profile: widget.profile,
                                    displayList: displayList,
                                    element: 'FIRE',
                                  )));
                    },
                  ),
                  //WATER
                  GestureDetector(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(5, 5))
                            ]),
                        child: Row(children: [
                          SizedBox(width: width * 0.055),
                          Text(
                            "WATER",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightBlueAccent),
                          ),
                        ])),
                    onTap: () {
                      FilterPokeList('water');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => element_list(
                                    profile: widget.profile,
                                    displayList: displayList,
                                    element: 'WATER',
                                  )));
                    },
                  ),
                  //ELECTRIC
                  GestureDetector(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(5, 5))
                            ]),
                        child: Row(children: [
                          SizedBox(width: width * 0.055),
                          Text(
                            "ELECTRIC",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.orangeAccent),
                          ),
                        ])),
                    onTap: () {
                      FilterPokeList('electric');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => element_list(
                                    profile: widget.profile,
                                    displayList: displayList,
                                    element: 'ELECTRIC',
                                  )));
                    },
                  ),
                  //ICE
                  GestureDetector(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(5, 5))
                            ]),
                        child: Row(children: [
                          SizedBox(width: width * 0.055),
                          Text(
                            "ICE",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent),
                          ),
                        ])),
                    onTap: () {
                      FilterPokeList('ice');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => element_list(
                                    profile: widget.profile,
                                    displayList: displayList,
                                    element: 'ICE',
                                  )));
                    },
                  ),
                  //GRASS
                  GestureDetector(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(5, 5))
                            ]),
                        child: Row(children: [
                          SizedBox(width: width * 0.055),
                          Text(
                            "GRASS",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        ])),
                    onTap: () {
                      FilterPokeList('grass');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => element_list(
                                    profile: widget.profile,
                                    displayList: displayList,
                                    element: 'GRASS',
                                  )));
                    },
                  ),
                  //GROUND
                  GestureDetector(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(5, 5))
                            ]),
                        child: Row(children: [
                          SizedBox(width: width * 0.055),
                          Text(
                            "GROUND",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown),
                          ),
                        ])),
                    onTap: () {
                      FilterPokeList('ground');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => element_list(
                                    profile: widget.profile,
                                    displayList: displayList,
                                    element: 'GROUND',
                                  )));
                    },
                  ),
                  //DARK
                  GestureDetector(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(5, 5))
                            ]),
                        child: Row(children: [
                          SizedBox(width: width * 0.055),
                          Text(
                            "DARK",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                        ])),
                    onTap: () {
                      FilterPokeList('dark');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => element_list(
                                    profile: widget.profile,
                                    displayList: displayList,
                                    element: 'DARK',
                                  )));
                    },
                  ),
                  //POISON
                  GestureDetector(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(5, 5))
                            ]),
                        child: Row(children: [
                          SizedBox(width: width * 0.055),
                          Text(
                            "POISON",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple),
                          ),
                        ])),
                    onTap: () {
                      FilterPokeList('poison');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => element_list(
                                    profile: widget.profile,
                                    displayList: displayList,
                                    element: 'POISON',
                                  )));
                    },
                  ),
                  //FIGHTING
                  GestureDetector(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(5, 5))
                            ]),
                        child: Row(children: [
                          SizedBox(width: width * 0.055),
                          Text(
                            "FIGHTING",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrangeAccent),
                          ),
                        ])),
                    onTap: () {
                      FilterPokeList('fighting');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => element_list(
                                    profile: widget.profile,
                                    displayList: displayList,
                                    element: 'FIGHTING',
                                  )));
                    },
                  ),
                  //PSYCHICH
                  GestureDetector(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(5, 5))
                            ]),
                        child: Row(children: [
                          SizedBox(width: width * 0.055),
                          Text(
                            "PSYCHIC",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo),
                          ),
                        ])),
                    onTap: () {
                      FilterPokeList('psychic');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => element_list(
                                    profile: widget.profile,
                                    displayList: displayList,
                                    element: 'PSYCHIC',
                                  )));
                    },
                  ),
                  //BUG
                  GestureDetector(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(5, 5))
                            ]),
                        child: Row(children: [
                          SizedBox(width: width * 0.055),
                          Text(
                            "BUG",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightGreen),
                          ),
                        ])),
                    onTap: () {
                      FilterPokeList('bug');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => element_list(
                                    profile: widget.profile,
                                    displayList: displayList,
                                    element: 'BUG',
                                  )));
                    },
                  ),
                  //GRAGON
                  GestureDetector(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(5, 5))
                            ]),
                        child: Row(children: [
                          SizedBox(width: width * 0.055),
                          Text(
                            "DRAGON",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent),
                          ),
                        ])),
                    onTap: () {
                      FilterPokeList('dragon');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => element_list(
                                    profile: widget.profile,
                                    displayList: displayList,
                                    element: 'DRAGON',
                                  )));
                    },
                  ),
                  // FAIRY
                  GestureDetector(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(5, 5))
                            ]),
                        child: Row(children: [
                          SizedBox(width: width * 0.055),
                          Text("FAIRY",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink)),
                        ])),
                    onTap: () {
                      FilterPokeList('fairy');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => element_list(
                                    profile: widget.profile,
                                    displayList: displayList,
                                    element: 'FAIRY',
                                  )));
                    },
                  ),
                  //FLYING
                  GestureDetector(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(5, 5))
                            ]),
                        child: Row(children: [
                          SizedBox(width: width * 0.055),
                          Text(
                            "FLYING",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigoAccent),
                          ),
                        ])),
                    onTap: () {
                      FilterPokeList('flying');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => element_list(
                                    profile: widget.profile,
                                    displayList: displayList,
                                    element: 'FLYING',
                                  )));
                    },
                  ),
                  //GHOST
                  GestureDetector(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(5, 5))
                            ]),
                        child: Row(children: [
                          SizedBox(width: width * 0.055),
                          Text(
                            "GHOST",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                        ])),
                    onTap: () {
                      FilterPokeList('ghost');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => element_list(
                                    profile: widget.profile,
                                    displayList: displayList,
                                    element: 'GHOST',
                                  )));
                    },
                  ),
                  //ROCK
                  GestureDetector(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(5, 5))
                            ]),
                        child: Row(children: [
                          SizedBox(width: width * 0.055),
                          Text(
                            "ROCK",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown),
                          ),
                        ])),
                    onTap: () {
                      FilterPokeList('rock');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => element_list(
                                    profile: widget.profile,
                                    displayList: displayList,
                                    element: 'ROCK',
                                  )));
                    },
                  ),
                  //STEEL
                  GestureDetector(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(5, 5))
                            ]),
                        child: Row(children: [
                          SizedBox(width: width * 0.055),
                          Text(
                            "STEEL",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),
                          ),
                        ])),
                    onTap: () {
                      FilterPokeList('steel');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => element_list(
                                    profile: widget.profile,
                                    displayList: displayList,
                                    element: 'STEEL',
                                  )));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(
                top: height * 0.013, left: width * 0.15, right: width * 0.15),
            width: width * 0.9,
            height: height * 0.05,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                color: Colors.blue[400],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.01),
              child: Column(
                children: const [
                  Text(
                    "ELEMENT",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
