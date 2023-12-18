import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reqres/utils/consts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reqres/service/auth_service.dart';

import 'homepage.dart';
import 'login.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async {
    await ref.read(AuthProvider).checkLogin();
    Timer(const Duration(seconds: 2), () {
      if (ref.read(AuthProvider).isLogin ) {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      } else {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          toolbarHeight: 0,
        ),
        backgroundColor: AppColors.backgroundColor,
        body: const Center(
          child: Text(AppStrings.appName,
              style: TextStyle(
                  color: AppColors.greenish,
                  fontSize: 64,
                  fontWeight: FontWeight.w800)),
        ));
  }
}
