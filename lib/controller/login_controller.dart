import 'package:dio/dio.dart';
import 'package:flutter_loginflow_getx/view/login_screen.dart';
import 'package:flutter_loginflow_getx/view/next_screen.dart';
import 'package:get/get.dart';

import '../model/login_response.dart';
import '../utils/data.dart';
import '../utils/data_utils.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find<LoginController>();

  final baseUrl = 'http://$ip/auth';

  final dio = Dio();

  void onInit() async {
    super.onInit();

    checkToken();
  }

//로그인
  Future<LoginResponse> login(
      {required String username, required String password}) async {
    final serialized = DataUtils.plainTobase64('$username:$password');

    final resp = await dio.post('$baseUrl/login', //path에 post
        //encode된 token을 authorization에 넣어줌
        options: Options(headers: {
          'authorization': 'Basic $serialized',
        }));

    return LoginResponse.fromJson(resp.data);
  }

  //앱을 처음 시작할 때 토큰이 존재하는지 확인 후 보내줄 스크린을 확인하는 과정 - splash screen
  Future<void> checkToken() async {
    String path = 'auth/token';

    //Token 불러오기
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);

    try {
// ignore: use_build_context_synchronously

      //refresh token을 이용해 access token을 발급받을 수 있음.
      //로그인 시 refresh token 발급 - refresh token을 이용해 만료된 access token 발급
      //access token을 이용해 api 정보 접근
      // ignore: unused_local_variable
      final resp = await dio.post('http://$ip/$path',
          options: Options(headers: {'authorization': 'Bearer $refreshToken'}));
      // ignore: use_build_context_synchronously
      Get.to(NextScreen());
    } catch (e) {
      //에러시 로그인 화면으로 이동하여 다시 로그인함.
      // ignore: use_build_context_synchronously
      Get.to(LoginScreen());
    }
  }
}
