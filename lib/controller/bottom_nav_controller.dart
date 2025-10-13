<<<<<<< HEAD
import 'package:get/get.dart';
import 'package:flutter/material.dart';
=======
  import 'package:get/get.dart';
>>>>>>> add41785e54426c9c91a03103392f5670ff6bfbb

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;
  

  var isMobile = true.obs;


  void updateLayout(BoxConstraints constraints){
  isMobile.value = constraints.maxWidth < 600;
}

  void changePage(int index) {
    currentIndex.value = index;
  }
}
