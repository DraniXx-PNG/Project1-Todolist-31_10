import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1_flutter/pages/Mobile%20Screen/history_mobile_page.dart';
import 'package:project1_flutter/pages/Mobile%20Screen/login_mobile_page.dart';
import 'package:project1_flutter/pages/Wide%20Screen/history_wide_page.dart';
import 'package:project1_flutter/pages/Wide%20Screen/login_wide_page.dart';
import 'package:project1_flutter/controller/todolist_controller.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final TodolistController controlller = Get.put(TodolistController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controlller.updateLayout(constraints); //Detection width screen
          //transforming load page
          return Obx(() => controlller.isMobile.value
             ? HistoryPageMobile() 
             : HistoryWidePage());
        }),
    );
  }
}