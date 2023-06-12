import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';
import 'next_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    String path = 'auth/login';

    return Scaffold(
      appBar: AppBar(
        title: const Text('login Screen'),
      ),
      body: SingleChildScrollView(
        //drag로 키보드 숨기기 가능
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          top: true,
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 500.0,
                ),
                TextFormField(
                    decoration: const InputDecoration(
                      hintText: '아이디',
                    ),
                    onChanged: (String value) {
                      //입력값 저장
                      username = value;
                    }),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: '비밀번호',
                  ),
                  onChanged: (String value) {
                    password = value;
                  },
                  //hidden
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    LoginController.to
                        .login(username: username, password: password)
                        .then((user) {
                      if (user != null) {
                        Get.to(NextScreen());
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('로그인'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
