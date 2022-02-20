import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/login_model.dart';
import 'ILoginService.dart';
import 'login_service_end_points.dart';

class LoginService extends ILoginService {
  final String rawValue = LoginServiceEndPoints.LOGIN.rawValue;
  LoginService(Dio dio) : super(dio);

  @override
  Future<LoginModel> fetchLoginItems(String username, String password) async {
    try {
      final response = await dio.post(
        rawValue,
        data: {
          "client_id": "yartu",
          "client_secret": "yartu",
          "grant_type": "password",
          "password": password,
          "username": username
        },
      );
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        debugPrint(data['ok'].toString());
        return LoginModel(
          access_token: data['acces_token'],
          ok: data['ok'],
        );
      }
      return LoginModel();
    } on DioError catch (e) {
      debugPrint(e.response.toString());
      return LoginModel(ok: false);
    }
  }
}
