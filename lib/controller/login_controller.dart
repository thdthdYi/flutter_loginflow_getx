import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/login_response.dart';
import '../model/user_model.dart';
import '../utils/data.dart';
import '../utils/data_utils.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find<LoginController>();

  final baseUrl = 'http://$ip/auth';

//로그인
  Future<LoginResponse> login(
      {required String username, required String password}) async {
    final serialized = DataUtils.plainTobase64('$username:$password');

    final resp = await Dio().post('$baseUrl/login', //path에 post
        //encode된 token을 authorization에 넣어줌
        options: Options(headers: {
          'authorization': 'Basic $serialized',
        }));

    return LoginResponse.fromJson(resp.data);
  }
}
