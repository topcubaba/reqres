import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'token_service.dart';


class AuthService with TokenService{
  AuthService() {
    checkLogin();
  }

  bool isLogin = false;

  Future<void> checkLogin() async {
    String? token = await getToken();
    if (token == null) {
      isLogin = false;
    }
    else{
      isLogin = true;
    }
  }

  void logOut() async{
    deleteToken();
    isLogin = false;
  }
}

final AuthProvider = Provider((ref) => AuthService());
