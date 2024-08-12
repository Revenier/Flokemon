import 'package:flutter/material.dart';
import 'package:frontend/admin_page/All_item.dart';
import 'package:frontend/admin_page/addItem.dart';
import 'package:frontend/admin_page/profile_admin.dart';
import 'package:frontend/user_page/CollectionPage.dart';

class NavBarAdmin extends StatefulWidget {
  final List<dynamic> profile;
  const NavBarAdmin({Key? key, required this.profile}) : super(key: key);

  @override
  State<NavBarAdmin> createState() => _NavBarAdminState();
}

class _NavBarAdminState extends State<NavBarAdmin> {
  int index = 0;
  late List<Widget> screen;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screen = [
      all_item(profile: widget.profile),
      addItem(),
      MainProfileAdmin(profile: widget.profile),
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
                    icon: Icon(Icons.collections_bookmark_rounded),
                    label: 'ITEM'),
                NavigationDestination(icon: Icon(Icons.add), label: 'ADD ITEM'),
                NavigationDestination(
                    icon: Icon(Icons.person_outline_rounded), label: 'PROFILE'),
              ]),
        ));
  }
}
