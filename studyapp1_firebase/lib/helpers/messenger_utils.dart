import 'package:flutter/material.dart';
import 'package:studyapp1_firebase/theme.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();

enum SnackBarType { error, info }

class MessengerUtils {
  static void showSnackBar(BuildContext context, String? message, [SnackBarType? type = SnackBarType.error]) {
    if (message == null) return;

    final snackBar = SnackBar(
      duration: const Duration(seconds: 5),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8), 
            child: type == SnackBarType.error 
              ? const Icon(Icons.error, color: AppColors.primary) 
              : const Icon(Icons.info, color: AppColors.info),
          ),
          Flexible(
            child: Text(message, style: TextStyle(
              color: type == SnackBarType.error ? AppColors.primary : AppColors.info,
            )),
          ),
        ],
      ), 
      backgroundColor: type == SnackBarType.error 
        ? AppColors.secondary 
        : AppColors.infoBg,
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}