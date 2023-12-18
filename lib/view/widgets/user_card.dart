import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:reqres/utils/consts.dart';

class UserCard extends StatelessWidget {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  const UserCard(
      {Key? key,
      required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.horizontalLow,
      child: Padding(
        padding: context.padding.onlyTopLow,
        child: Container(
          padding: EdgeInsets.only(left: context.sized.lowValue),
          height: context.sized.dynamicHeight(0.15),
          decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.only(
                    bottomLeft: Radius.circular(65),
                    topLeft: Radius.circular(65),
                    ),
              color: AppColors.greenish),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(avatar),
                radius: context.sized.dynamicHeight(0.065),
              ),
              Padding(
                padding: context.padding.low,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      AppStrings.firstName + firstName,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: context.sized.normalValue,
                      ),
                    ),
                    Text(
                      AppStrings.lastName + lastName,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: context.sized.normalValue,
                      ),
                    ),
                    SizedBox(height: context.sized.dynamicHeight(0.025),),
                    Text(
                      email,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: context.sized.dynamicHeight(0.015),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
