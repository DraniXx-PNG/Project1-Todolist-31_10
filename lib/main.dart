import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1_flutter/controller/auth_controller.dart';
import 'package:project1_flutter/routes/pages.dart';
import 'package:project1_flutter/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 
  final authController = Get.put(AuthController(), permanent: true);

  runApp(const MyApp());

  
  await authController.autoLogin();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.Splashscreen,
      getPages: AppPages.pages,
    );
  }
}
