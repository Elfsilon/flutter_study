import 'package:flutter/material.dart';
import 'package:studyapp1_firebase/main.dart';

Future<T> withFullscreenProgressIndicator<T>(BuildContext context, Future<T> Function() callback) async {
    showDialog(
      context: context, 
      barrierDismissible: true,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    final result = await callback();
    navigatorKey.currentState!.pop();
    return result;
  } 