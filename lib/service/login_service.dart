import 'dart:io';

import 'package:dio/dio.dart';
import 'package:reqres/model/login_req_model.dart';
import 'package:reqres/model/login_res_model.dart';
import 'package:reqres/utils/api_endpoints.dart';

abstract class ILoginService {
  ILoginService(this.dio);

  Future<LoginResModel?> checkLogin(LoginReqModel model);
  final Dio dio;
}

class LoginService extends ILoginService {
  LoginService(Dio dio) : super(dio);

  @override
  Future<LoginResModel?> checkLogin(LoginReqModel model) async {
    try {
      final response = await dio.post(
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
        ApiEndpoints.authEndpoints.loginEmail, data: model);
      if (response.statusCode == HttpStatus.ok) {
        return LoginResModel.fromJson(response.data);
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}