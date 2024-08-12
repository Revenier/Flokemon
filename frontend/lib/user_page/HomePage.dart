import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:frontend/user_page/MenuElement.dart';
import 'package:frontend/user_page/shoppingcart.dart';

class HomePage extends StatefulWidget {
  final List<dynamic> profile;
  const HomePage({Key? key, required this.profile}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          shopping_cart(profile: widget.profile)));
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(
              height: height * 0.2,
              width: width,
              child: AnotherCarousel(
                images: const [
                  AssetImage("assets/Slide image/3.png"),
                  AssetImage("assets/Slide image/2.png"),
                  AssetImage("assets/Slide image/1.png")
                ],
                dotSize: 6,
                indicatorBgPadding: 8,
                dotBgColor: Colors.black26,
                dotIncreasedColor: Colors.black,
              )),
          Padding(
            padding: const EdgeInsets.only(
                top: 9.0, left: 30.0, right: 30.0, bottom: 10),
            child: Menu_Element(profile: widget.profile),
          ),
        ],
      ),
    );
  }
}
