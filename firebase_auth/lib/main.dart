import 'package:firebase_auth/pages/congrats_page.dart';
import 'package:firebase_auth/pages/login_page.dart';
import 'package:firebase_auth/pages/signup_page.dart';
import 'package:flutter/material.dart';

class Constants {
  static const BorderRadius borderRadius = BorderRadius.all(Radius.circular(16));
}

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
        brightness: Brightness.dark,
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.grey.shade900,
        textTheme: const TextTheme(
          headline6: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          bodyText2: TextStyle(fontSize: 14.0),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: Constants.borderRadius,
            )),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size.zero),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.black45,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black
            ),
            borderRadius: Constants.borderRadius,
          ),
          
        ),
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