import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1_flutter/controller/bottom_nav_controller.dart';
import 'package:project1_flutter/pages/home_page.dart';
import 'package:project1_flutter/pages/history_page.dart';
import 'package:project1_flutter/pages/profile_page.dart';

class BottomNavView extends StatelessWidget {
  BottomNavView({super.key});

  final BottomNavController navController = Get.put(BottomNavController());

  final List<Widget> pages = [
    HomePage(),
    HistoryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: pages[navController.currentIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navController.currentIndex.value,
            onTap: navController.changePage,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        ));
  }
}
