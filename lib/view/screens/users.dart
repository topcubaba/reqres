import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:reqres/view/widgets/user_card.dart';
import 'package:http/http.dart' as http;

import '../../utils/api_endpoints.dart';
import '../../utils/consts.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

Map? responseMap;
List? responseList;


//TODO: Convert it to Dio and create model
class _UsersScreenState extends State<UsersScreen> {
  Future getUsers() async {
    http.Response response;
    response = await http.get(
        Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.authEndpoints.userList));
    if (response.statusCode == 200) {
      setState(() {
        responseMap = json.decode(response.body);
        responseList = responseMap?['data'];
      });
    }
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
