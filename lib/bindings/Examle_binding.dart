import 'package:get/get.dart';

import 'package:project1_flutter/controller/example_controller.dart';


class ExamleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExampleController>(() => ExampleController());
  }
}