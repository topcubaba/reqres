import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reqres/view/widgets/user_card.dart';

import '../../utils/api_endpoints.dart';
import '../../utils/consts.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

Map? responseMap;
List? responseList;

class _UsersScreenState extends State<UsersScreen> {
  Future getUsers() async {
    try {
      var dio = Dio();
      var response = await dio
          .get(ApiEndpoints.baseUrl + ApiEndpoints.authEndpoints.userList);

      if (response.statusCode == 200) {
        setState(() {
          var responseData = response.data;
          responseList = responseData['data'];
        });
      } else {
        print(response.statusMessage);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        _showErrorSnackBar(e, context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  void _showErrorSnackBar(DioException error, BuildContext context) {
    String errorMessage = AppStrings.error;

    if (error.type == DioExceptionType.badResponse) {
      errorMessage = '${AppStrings.invalidStatus}${error.response?.statusCode}';
    } else if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      errorMessage = AppStrings.connectionTimeout;
    } else if (error.type == DioExceptionType.unknown) {
      errorMessage = AppStrings.connectionFailed;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage)),
    );
  }

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.backgroundColor,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return UserCard(
                id: responseList![index]['id'],
                email: responseList![index]['email'],
                firstName: responseList![index]['first_name'],
                lastName: responseList![index]['last_name'],
                avatar: responseList![index]['avatar']);
          },
          itemCount: responseList == null ? 0 : responseList!.length,
        ));
  }
}
