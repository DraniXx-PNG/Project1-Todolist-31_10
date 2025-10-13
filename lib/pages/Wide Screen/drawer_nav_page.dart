import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1_flutter/controller/drawer_nav_controller.dart';
import 'package:project1_flutter/controller/auth_controller.dart';
import 'package:project1_flutter/pages/Wide%20Screen/history_wide_page.dart';
import 'package:project1_flutter/pages/Wide%20Screen/profile_wide_page.dart';
import 'package:project1_flutter/pages/Wide%20Screen/todolist_wide_page.dart';

class DrawerNavPage extends StatelessWidget {
  DrawerNavPage({super.key});

  final DrawerNavController mainController = Get.put(DrawerNavController());
  final AuthController authController = Get.find<AuthController>();

  final List<Widget> pages = [
    TodolistWidePage(),
    HistoryWidePage(),
    ProfileWidePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final user = authController.users[authController.currentUserIndex.value];

    return Obx(() => Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 68, 149, 216),
            foregroundColor: Colors.white,
            title: Text(
              _getTitle(mainController.selectedIndex.value),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            elevation: 0,
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 68, 149, 216),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(user["photo"] as String),
                    ),
                  ),
                  accountName: Text(
                    user["name"] as String,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  accountEmail: Text(user["email"] as String),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Home"),
                  onTap: () {
                    mainController.changePage(0);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.calculate),
                  title: const Text("History"),
                  onTap: () {
                    mainController.changePage(1);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("Profile"),
                  onTap: () {
                    mainController.changePage(2);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          body: Container(
            color: Colors.white,
            child: pages[mainController.selectedIndex.value],
          ),
        ));
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return "Todo List";
      case 1:
        return "History Task";
      case 2:
        return "Profile";
      default:
        return "";
    }
  }
}
