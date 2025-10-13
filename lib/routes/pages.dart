import 'package:get/get.dart';
<<<<<<< HEAD
import 'package:project1_flutter/pages/todolist_page.dart';
=======
import 'package:project1_flutter/bindings/Examle_binding.dart';
import 'package:project1_flutter/bindings/contact_binding.dart';
import 'package:project1_flutter/bindings/splash_binding.dart';
import 'package:project1_flutter/pages/contact_page.dart';
import 'package:project1_flutter/pages/example_page.dart';
import 'package:project1_flutter/pages/home_page.dart';
>>>>>>> add41785e54426c9c91a03103392f5670ff6bfbb
import 'package:project1_flutter/pages/login_page.dart';

import 'package:project1_flutter/pages/history_page.dart';
import 'package:project1_flutter/pages/main_page.dart';
import 'package:project1_flutter/pages/profile_page.dart';
import 'package:project1_flutter/pages/splashscreen_page.dart';
import 'package:project1_flutter/pages/todolistedit_page.dart';
import 'package:project1_flutter/routes/routes.dart';
import '../bindings/login_binding.dart';
import '../bindings/bottom_nav_binding.dart';
import '../bindings/todolist_binding.dart';
import '../bindings/todolist_edit_binding.dart';
import '../bindings/history_binding.dart';
import '../bindings/profile_binding.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () =>  LoginPage(),
      binding: LoginBinding(),
    ),
 
    GetPage(
      name: AppRoutes.todolist,
      page: () =>  TodolistPage(),
      binding: TodolistBinding(),
    ),
    GetPage(
      name: AppRoutes.todolistEdit,
      page: () => TodolistEditPage(),
      binding: TodolistEditBinding(),
    ),
    GetPage(
      name: AppRoutes.history,
      page: () =>  HistoryPage(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () =>  ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
<<<<<<< HEAD
      name: AppRoutes.main,
      page: () =>  MainPage(),
    ),
  ];
=======
      name: AppRoutes.splash,
      page: () =>  SplashscreenPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.contact,
      page: () =>  ContactPage(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: AppRoutes.examplescreen,
      page: () =>  ExamplePage(),
      binding: ExamleBinding(),
  
  )];
>>>>>>> add41785e54426c9c91a03103392f5670ff6bfbb
}

