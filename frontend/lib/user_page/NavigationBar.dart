import 'package:flutter/material.dart';
import 'package:frontend/user_page/CollectionPage.dart';
import 'package:frontend/user_page/HomePage.dart';
import 'package:frontend/user_page/SearchPage.dart';
import 'package:frontend/user_page/profile_user.dart';
import 'package:frontend/both/LoginPage.dart';

class BottomNavBar extends StatefulWidget {
  final List<dynamic> profile;
  const BottomNavBar({Key? key, required this.profile}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;
  late List<Widget> screen;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screen = [
      HomePage(profile: widget.profile),
      SearchPage(profile: widget.profile),
      MyCollection(profile: widget.profile),
      MainProfileUser(profile: widget.profile),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screen[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              backgroundColor: Colors.blue.shade50,
              indicatorColor: Colors.white,
              labelTextStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
          child: NavigationBar(
              height: 60,
              selectedIndex: index,
              onDestinationSelected: (index) =>
                  setState(() => this.index = index),
              destinations: const [
                NavigationDestination(
                    icon: Icon(Icons.home_outlined), label: 'HOME'),
                NavigationDestination(
                    icon: Icon(Icons.search), label: 'SEARCH'),
                NavigationDestination(
                    icon: Icon(Icons.collections_bookmark_rounded),
                    label: 'COLLECTION'),
                NavigationDestination(
                    icon: Icon(Icons.person_outline_rounded), label: 'PROFILE'),
              ]),
        ));
  }
}
