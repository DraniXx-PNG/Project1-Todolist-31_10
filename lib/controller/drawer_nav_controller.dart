
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DrawerNavController extends GetxController {
  var selectedIndex = 0.obs;

   var isMobile = true.obs;


  void updateLayout(BoxConstraints constraints){
  isMobile.value = constraints.maxWidth < 600;
}

  void changePage(int index) {
    selectedIndex.value = index;
  }
}