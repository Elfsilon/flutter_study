import 'package:firebase_auth/pages/congrats_page.dart';
import 'package:firebase_auth/pages/login_page.dart';
import 'package:firebase_auth/pages/signup_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: {
        "/login": (context) => const LoginPage(),
        "/signup":(context) => const SignupPage(),
        "/congrats":(context) => const CongratsPage(),
      },
    );
  }
}