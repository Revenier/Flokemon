import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/user_page/HomePage.dart';
import 'package:frontend/both/LoginPage.dart';

import 'package:http/http.dart' as http;
import 'package:email_validator/email_validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final bool obscureText = true;
  final String hintText = "";
  String password = "";
  String confirmPassword = "";
  int flagemail = 0;
  int flaguser = 0;
  int flagpass = 0;

  void _registerOnPressed(BuildContext context) async {
    await usernameCheck();
    await emailCheck();
    await passCheck();
    if (flaguser == 1) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Username already existed!")));
    } else if (flagemail == 1) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Email already existed!")));
    } else if (flagpass == 1) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Password already existed!")));
    } else {
      //Masukin data ke db
      String url = "http://10.0.2.2:8080/users/register";
      String json = jsonEncode({
        "username": usernameController.text,
        "userpass": passwordController.text,
        "email": emailController.text,
      });
      final resp = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"}, body: json);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  Future<void> emailCheck() async {
    String urlemail = "http://10.0.2.2:8080/users/googlefetch";
    final response = await http
        .post(Uri.parse(urlemail), body: {"email": emailController.text});
    //sudah ada data
    if (response.statusCode == 200) {
      flagemail = 1;
    } else {
      flagemail = 0;
    }
  }

  Future<void> usernameCheck() async {
    String urluser = "http://10.0.2.2:8080/users/usernamefetch";
    final response = await http
        .post(Uri.parse(urluser), body: {"username": usernameController.text});
    //sudah ada data
    if (response.statusCode == 200) {
      flaguser = 1;
    } else {
      flaguser = 0;
    }
  }

  Future<void> passCheck() async {
    String urlpass = "http://10.0.2.2:8080/users/passwordfetch";
    final response = await http
        .post(Uri.parse(urlpass), body: {"userpass": passwordController.text});
    //sudah ada data
    if (response.statusCode == 200) {
      flagpass = 1;
    } else {
      flagpass = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 90),
                // logo
                Image.asset('assets/Logo/pokemon.PNG', height: 150, width: 150),

                const SizedBox(height: 80),

                Form(
                  key: _formkey,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      children: [
                        // username

                        TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            hintText: 'Username',
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please fill username";
                            } else if (value.length < 8 || value.length > 16) {
                              return 'Username must be more than 8 characters and less than 16!';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 10),

                        // Email
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter the Email";
                            } else if (EmailValidator.validate(value) ==
                                false) {
                              return "Email has wrong format!";
                            }

                            return null;
                          },
                        ),

                        const SizedBox(height: 10),

                        //password
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          obscureText: obscureText,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter the Password";
                            } else if (value.length < 8 || value.length > 16) {
                              return 'Password must be more than 8 characters and less than 16!';
                            }
                            setState(() {
                              password = value;
                            });
                            return null;
                          },
                        ),

                        const SizedBox(height: 10),

                        //Confirm password
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          obscureText: obscureText,
                          validator: (value) {
                            if (value != password) {
                              return "Password not match";
                            }
                            setState(() {
                              confirmPassword = value!;
                            });
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const SizedBox(width: 80),
                            const Text("Already have account?"),
                            GestureDetector(
                              child: const Text(
                                " Login",
                                style: TextStyle(color: Colors.blue),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()));
                                // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const RegisterPage()));
                              },
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        ElevatedButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate())
                                _registerOnPressed(context);
                            },
                            child: const Text("Sign Up")),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
