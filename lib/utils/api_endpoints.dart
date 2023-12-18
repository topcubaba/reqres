class ApiEndpoints {
  static const String baseUrl = 'https://reqres.in/api/';
  static _AuthEndpoints authEndpoints = _AuthEndpoints();
}

class _AuthEndpoints {
  final String loginEmail = 'login';
  final String userList = 'users?page=1';
}