import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:frontend/both/Account.dart';
import 'package:frontend/both/LoginPage.dart';
import 'package:frontend/admin_page/orderList.dart';
import 'package:http/http.dart' as http;

class MainProfileAdmin extends StatefulWidget {
  final List<dynamic> profile;
  const MainProfileAdmin({Key? key, required this.profile}) : super(key: key);

  @override
  State<MainProfileAdmin> createState() => _MainProfileAdminState();
}

class _MainProfileAdminState extends State<MainProfileAdmin> {
  late List<dynamic> profile1;
  String username = "";
  String name = "";
  String password = "";
  String nameupdate = "";

  late Future<void> profileFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileFuture = updateProfile();
  }

  Future<void> updateProfile() async {
    for (dynamic element in widget.profile) {
      // Access values from each map in the list
      username = element['username'];
      password = element['userpass'];
    }
    String url = "http://10.0.2.2:8080/users/login";
    try {
      final response = await http.post(Uri.parse(url), body: {
        "username": username,
        "userpass": password,
      });

      if (response.statusCode == 200) {
        dynamic result = jsonDecode(response.body);

        // Check if the result is a list
        if (result is List) {
          // Handle the list data if needed
          profile1 = result;
          for (dynamic element in profile1) {
            // Access values from each map in the list

            name = element['name'];
          }
          // return null;
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid username or password0'),
          ),
        );
      }
    } catch (e) {
      // Handle network or other errors
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred.'),
        ),
      );
    }

    return;
  }

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color.fromARGB(255, 59, 167, 255),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "PROFILE",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: FutureBuilder<void>(
            future: profileFuture,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                double height = MediaQuery.of(context).size.height;
                double width = MediaQuery.of(context).size.width;
                return Stack(children: [
                  Column(children: [
                    Center(
                        child: Container(
                            margin: EdgeInsets.only(top: height * 0.03),
                            width: width * 0.27,
                            height: height * 0.27,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(200))))
                  ]),
                  Center(
                      child: Container(
                    margin: EdgeInsets.only(
                      bottom: height * 0.05,
                      left: width * 0.05,
                      right: width * 0.05,
                      top: height * 0.10,
                    ),
                    width: width * 0.9,
                    height: height * 0.7,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(40)),
                  )),
                  Column(children: [
                    Center(
                        child: Container(
                            margin: EdgeInsets.only(top: height * 0.05),
                            width: width * 0.2,
                            height: height * 0.1,
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(100)),
                            child:
                                Image.asset('assets/Logo/pokeball_blue.png')))
                  ]),
                  Container(
                    margin:
                        EdgeInsets.only(top: height * 0.15, left: width * 0.35),
                    width: width * 0.3,
                    height: height * 0.06,
                    // color: Colors.purple,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: height * 0.18, left: width * 0.35),
                      width: width * 0.3,
                      height: height * 0.06,
                      // color: Colors.purple,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(username,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14))
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.25, left: width * 0.122),
                      child: Container(
                        width: width * 0.2,
                        height: height * 0.03,
                        child: Row(
                          children: [
                            AutoSizeText(
                              "General",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      )),
                  Column(children: [
                    GestureDetector(
                      child: Center(
                          child: Container(
                              margin: EdgeInsets.only(top: height * 0.29),
                              width: width * 0.792,
                              height: height * 0.067,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: const Offset(5, 5))
                                  ]),
                              child: Row(children: [
                                SizedBox(width: width * 0.052),
                                Container(
                                    child: FittedBox(
                                        child: Icon(Icons.list, size: 35))),
                                SizedBox(
                                  width: width * 0.051,
                                ),
                                AutoSizeText("Order List",
                                    style: TextStyle(fontSize: 14)),
                                // SizedBox(width: width* 0.344),
                                // Container(child: FittedBox(child: Icon(Icons.arrow_forward,size: 25),)),
                              ]))),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => order_list(
                                      profile: widget.profile,
                                    )));
                      },
                    )
                  ]),
                  Column(children: [
                    GestureDetector(
                      child: Center(
                          child: Container(
                              margin: EdgeInsets.only(top: height * 0.38),
                              width: width * 0.792,
                              height: height * 0.067,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: const Offset(5, 5))
                                  ]),
                              child: Row(children: [
                                SizedBox(width: width * 0.052),
                                Container(
                                    child: FittedBox(
                                        child: Icon(Icons.person_outline,
                                            size: 35))),
                                SizedBox(
                                  width: width * 0.051,
                                ),
                                AutoSizeText("Edit Profile",
                                    style: TextStyle(fontSize: 14)),
                                // SizedBox(width: width* 0.38),
                                // Container(child: FittedBox(child: Icon(Icons.arrow_forward,size: 25))),
                              ]))),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    edit_account(profile: widget.profile)));
                      },
                    )
                  ]),
                  Column(children: [
                    GestureDetector(
                      child: Center(
                          child: Container(
                              margin: EdgeInsets.only(top: height * 0.47),
                              width: width * 0.792,
                              height: height * 0.067,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: const Offset(5, 5))
                                  ]),
                              child: Row(children: [
                                SizedBox(width: width * 0.052),
                                Container(
                                    child: FittedBox(
                                        child: Icon(
                                            Icons.notifications_none_outlined,
                                            size: 35))),
                                SizedBox(
                                  width: width * 0.051,
                                ),
                                AutoSizeText("Notification",
                                    style: TextStyle(fontSize: 14)),
                                SizedBox(width: width * 0.2),
                                Switch(
                                    value: isSwitched,
                                    onChanged: (value) {
                                      setState(() {
                                        isSwitched = value;
                                      });
                                    })
                                // Container(child: FittedBox(child:  Icon(Icons.arrow_forward,size: 25))),
                              ]))),
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> settingPage()));
                      },
                    ),
                  ]),
                  Column(children: [
                    GestureDetector(
                      child: Center(
                          child: Container(
                              margin: EdgeInsets.only(top: height * 0.56),
                              width: width * 0.792,
                              height: height * 0.067,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: const Offset(5, 5))
                                  ]),
                              child: Row(children: [
                                SizedBox(width: width * 0.052),
                                Container(
                                    child: FittedBox(
                                        child: Icon(Icons.logout_outlined,
                                            size: 35))),
                                SizedBox(
                                  width: width * 0.051,
                                ),
                                AutoSizeText("Log Out",
                                    style: TextStyle(fontSize: 14)),
                                // SizedBox(width: width* 0.33),
                                // Container(child: FittedBox(child: Icon(Icons.arrow_forward,size: 25))),
                              ]))),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                    )
                  ])
                ]);
              }
            }));
  }
}
