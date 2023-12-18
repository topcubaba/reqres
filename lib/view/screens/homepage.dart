import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';
import 'package:reqres/service/auth_service.dart';
import 'package:reqres/service/token_service.dart';
import 'package:reqres/view/screens/users.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/consts.dart';
import 'login.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> with TokenService {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: context.padding.onlyLeftLow,
                child: const Text(
                  AppStrings.appName,
                  style: TextStyle(
                      color: AppColors.greenish,
                      fontWeight: FontWeight.w900,
                      fontSize: 26),
                ),
              ),
              IconButton(
                  onPressed: () {
                    ref.read(AuthProvider).logOut();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    ).then((value) {
                      Navigator.pop(context);
                    });
                  },
                  icon: const Icon(
                    Icons.logout_outlined,
                    color: AppColors.greenish,
                  ))
            ],
          )),
      backgroundColor: AppColors.backgroundColor,
      body: UsersScreen(),
    );
  }
}
