import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1_flutter/controller/example_controller.dart';
import 'package:project1_flutter/pages/exmp_widescreen.dart';
import 'package:project1_flutter/pages/mobail/mobile.example.dart';

class ExamplePage extends StatelessWidget {
  ExamplePage({super.key});
  final controller = Get.find<ExampleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder:( context, constraints) {
          
          return Obx(()=> controller.isMobile.value 
          ? MobileExample() 
          : ExmpWidescreen(),
          );
        } ,
    ),
    );
  }
  }
  

