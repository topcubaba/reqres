import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reqres/model/login_req_model.dart';
import 'package:reqres/utils/api_endpoints.dart';
import 'package:reqres/service/token_service.dart';
import 'package:reqres/view/screens/login.dart';
import 'package:reqres/service/login_service.dart';
import 'package:dio/dio.dart';

import '../view/screens/homepage.dart';

abstract class LoginController extends ConsumerState<LoginScreen> with TokenService{


  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late final LoginService loginService;

  @override
  void initState() {
    super.initState();
    final dio = Dio(BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
    ));
    loginService = LoginService(dio);
  }

  Future<void> login(String email, String password) async {
    final response = await loginService.checkLogin(LoginReqModel(
      email: email,
      password: password,
    ));

    if (response != null) {
      saveToken(response.token ?? "null");
      Navigator.pop(context);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyHomePage()));
    }
    }

}

