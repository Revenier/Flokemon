import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/admin_page/navBarAdmin.dart';
import 'package:frontend/user_page/NavigationBar.dart';

class edit_account extends StatefulWidget {
  final List<dynamic> profile;
  const edit_account({Key? key, required this.profile}) : super(key: key);

  @override
  State<edit_account> createState() => _edit_accountState();
}

class _edit_accountState extends State<edit_account> {
  final bool obscureText = true;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _statusController = TextEditingController();
  String _name = "";
  String _userName = "";
  String _email = "";
  String _password = "";
  String _status = "";

  @override
  void initState() {
    for (dynamic element in widget.profile) {
      // Access values from each map in the list
      _name = element['name'];
      _userName = element['username'];
      _email = element['email'];
      _password = element['userpass'];
      if (element['accountstatus'] == 0) {
        _status = "admin";
      } else if (element['accountstatus'] == 1) {
        _status = "user";
      }
    }
    super.initState();
    _nameController.text = _name;
    _usernameController.text = _userName;
    _emailController.text = _email;
    _passwordController.text = _password;
    _statusController.text = _status;
  }

  void _updatenameOnPressed(BuildContext context) async {
    String url = "http://10.0.2.2:8080/users/updatename";
    String json = jsonEncode({
      "oldname": _name,
      "newname": _nameController.text,
    });

    final resp = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: json);
    if (resp.statusCode == 200) {
      _name = _nameController.text;
      //notif
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Name updated to $_name'),
        ),
      );
      if (_status == "admin") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NavBarAdmin(profile: widget.profile)));
      } else if (_status == "user") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BottomNavBar(profile: widget.profile)));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Unexpected Error'),
        ),
      );
    }
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "ACCOUNT",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: width * 0.01),
                    height: height * 0.03,
                    width: width * 0.2,
                    child: Text(
                      "Nama",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(width: width * 0.64),
                ],
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
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'name',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      // borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: width * 0.01),
                    height: height * 0.03,
                    width: width * 0.2,
                    child: FittedBox(
                        child: Text(
                      "Username",
                      style: TextStyle(fontSize: 18),
                    )),
                    // color: Colors.amber,
                  ),
                  SizedBox(width: width * 0.64),
                ],
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
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      hintText: 'Username',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        // borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    enabled: false),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: width * 0.01),
                    height: height * 0.03,
                    width: width * 0.2,
                    child: Text("Email", style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(width: width * 0.64),
                ],
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
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        // borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    enabled: false),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: width * 0.01),
                    height: height * 0.03,
                    width: width * 0.25,
                    child: Text("Password", style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(width: width * 0.64),
                ],
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
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        // borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    obscureText: obscureText,
                    enabled: false),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: width * 0.01),
                    height: height * 0.03,
                    width: width * 0.2,
                    child: Text("Status", style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(width: width * 0.64),
                ],
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
                    controller: _statusController,
                    decoration: const InputDecoration(
                      hintText: 'status',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        // borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    enabled: false),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ElevatedButton(
                onPressed: () => _updatenameOnPressed(context),
                child: Text('Update Name'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
