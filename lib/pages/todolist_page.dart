import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1_flutter/controller/todolist_controller.dart';
import 'package:project1_flutter/pages/Mobile%20Screen/todolist_mobile_page.dart';
import 'package:project1_flutter/pages/Wide%20Screen/todolist_wide_page.dart';

class TodolistPage extends StatelessWidget {
  TodolistPage({super.key});

  final TodolistController controlller = Get.put(TodolistController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controlller.updateLayout(constraints); //Detection width screen
          //transforming load page
          return Obx(() => controlller.isMobile.value
             ? TodolistMobilePage() 
             : TodolistWidePage());
        }),
    );
  }
}