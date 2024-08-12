import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:frontend/both/CreateAcc.dart';
import 'package:frontend/user_page/NavigationBar.dart';
import 'package:frontend/both/RegisterPage.dart';
import 'package:frontend/both/googleOA.dart';
import 'package:provider/provider.dart';
import 'package:frontend/admin_page/navBarAdmin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late Account user;
  late List<dynamic> profile;
  final bool obscureText = true;
  final String hintText = "";
  String username = "";
  String userpass = "";
  late int accountstats;
  late final googleOA data;
  late String? googleEmail;
  late String? googleName;

  void handleLogin() {
    if (profile.isNotEmpty) {
      // Navigate to the next screen or perform any other actions based on the user data
      if (accountstats == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BottomNavBar(
                    profile: profile,
                  )),
        );
      } else if (accountstats == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NavBarAdmin(
                    profile: profile,
                  )),
        );
      }
    } else {
      // Handle invalid credentials
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid username or password'),
        ),
      );
    }
  }

  Future<void> fetchLogin(String usernameLogin, String passwordLogin) async {
    String url = "http://10.0.2.2:8080/users/login";
    try {
      final response = await http.post(Uri.parse(url), body: {
        "username": usernameLogin,
        "userpass": passwordLogin,
      });

      if (response.statusCode == 200) {
        dynamic result = jsonDecode(response.body);

        // Check if the result is a list
        if (result is List) {
          // Handle the list data if needed
          for (dynamic element in result) {
            // Access values from each map in the list
            accountstats = element['accountstatus'];
          }
          profile = result;
          return null;
        }

        // Assume the result is a map
        final Map<String, dynamic> resultMap = result;
        print(resultMap);

        final user = Account.fromJson(result);

        return;
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

    return null;
  }

  Future<void> googleFetch() async {
    String url = "http://10.0.2.2:8080/users/googlefetch";
    try {
      final response =
          await http.post(Uri.parse(url), body: {"email": googleEmail});
      //sudah ada data
      if (response.statusCode == 200) {
        dynamic result = jsonDecode(response.body);

        // Check if the result is a list
        if (result is List) {
          // Handle the list data if needed
          for (dynamic element in result) {
            // Access values from each map in the list
            accountstats = element['accountstatus'];
          }
          profile = result;
          return;
        }
      } else {
        String usernameNew = googleName!.replaceAll(' ', '');
        //No account
        //Buat data baru
        String urlReg = "http://10.0.2.2:8080/users/register";
        String json = jsonEncode({
          "username": usernameNew,
          "userpass": usernameNew,
          "email": googleEmail,
        });
        final resp = await http.post(Uri.parse(urlReg),
            headers: {"Content-Type": "application/json"}, body: json);
        fetchLogin(usernameNew, usernameNew);
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

    return null;
  }

  @override
  Widget build(BuildContext context) {
    String? tes;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 90),

                // logo
                Image.asset('assets/Logo/pokemon.PNG',
                    height: height * 0.2, width: width * 0.5),

                const SizedBox(height: 100),

                Form(
                  key: _formKey,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      children: [
                        // username
                        TextFormField(
                          controller: _usernameController,
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
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: height * 0.015),

                        //password
                        TextFormField(
                          controller: _passwordController,
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
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: height * 0.05),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: GestureDetector(
                              child: Container(
                                width: width * 0.25,
                                height: height * 0.05,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Image.asset('assets/Logo/google.png'),
                              ),
                              onTap: () async {
                                final provider = Provider.of<googleOA>(context,
                                    listen: false);

                                await provider.signWGoogle();
                                googleEmail = provider.account?.email;
                                googleName = provider.account?.displayName;

                                if (googleEmail == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Google email failed'),
                                    ),
                                  );
                                } else {
                                  await googleFetch();
                                  handleLogin();
                                }
                              },
                            )),
                            SizedBox(
                              width: width * 0.05,
                            ),
                            Container(
                              width: width * 0.25,
                              height: height * 0.05,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    await fetchLogin(_usernameController.text,
                                        _passwordController.text);
                                    handleLogin();
                                  }
                                },
                                child: const Text("Sign In"),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: height * 0.02),
                        GestureDetector(
                          child: const Text("Create Account"),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterPage()));
                            // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const RegisterPage()));
                          },
                        )
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
