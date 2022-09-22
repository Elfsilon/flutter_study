import 'package:flutter/material.dart';
import 'package:studyapp2_architectures/inherited_widget_way/user_state.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context){
    final user = UserState.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Name: ${user.name}"),
        Text("Weapon: ${user.weapon}"),
        Text("Kills: ${user.kills}"),
      ],
    );
  }
}