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


  
  //TODO: Fix image border design issue
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.horizontalLow,
      child: Padding(
        padding: context.padding.onlyTopLow,
        child: Container(
          height: context.sized.dynamicHeight(0.14),
          decoration: BoxDecoration(
              borderRadius: context.border.normalBorderRadius,
              color: AppColors.greyish),
          child: Row(
            children: <Widget>[
              Container(
                  width: context.sized.dynamicWidth(0.3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(image: NetworkImage(avatar)))),
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
                    const Spacer(),
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
