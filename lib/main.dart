import 'package:flutter/material.dart';
import 'package:flutter_loginflow_getx/controller/login_controller.dart';
import 'package:get/get.dart';

import 'view/login_screen.dart';

void main() {
  runApp(const MyApp());
  Get.put(LoginController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter login',
      home: LoginScreen(),
    );
  }
}
