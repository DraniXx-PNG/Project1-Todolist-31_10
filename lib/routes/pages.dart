import 'package:get/get.dart';
import 'package:project1_flutter/pages/todolist_page.dart';
import 'package:project1_flutter/pages/login_page.dart';

import 'package:project1_flutter/pages/history_page.dart';
import 'package:project1_flutter/pages/main_page.dart';
import 'package:project1_flutter/pages/profile_page.dart';
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
      binding: AuthBinding(),
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
      name: AppRoutes.main,
      page: () =>  MainPage(),
    ),
  ];
}
