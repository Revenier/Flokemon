import 'package:flutter/material.dart';
import 'package:frontend/both/LoginPage.dart';
import 'package:frontend/both/googleOA.dart';
import 'package:frontend/user_page/NavigationBar.dart';
import 'package:frontend/user_page/SearchPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => googleOA(),
        child : MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flokemon',
        home: LoginPage(),
    ),
    );

  }
}
