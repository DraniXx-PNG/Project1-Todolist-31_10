
import 'package:get/get.dart';
import 'package:project1_flutter/pages/login_page.dart';
import 'package:project1_flutter/routes/routes.dart'; 

class AppPages{
  static final pages = [
    GetPage(
    name: AppRoutes.login,
    page: () => LoginPage()
       )
  ];

}