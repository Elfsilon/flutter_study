import 'package:flutter/material.dart';
import 'package:studyapp1_firebase/pages/login_page.dart';
import 'package:studyapp1_firebase/pages/signup_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({ Key? key }) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLoginPage = true;

  void togglePage() => setState(() => isLoginPage = !isLoginPage);

  @override
  Widget build(BuildContext context) {
    return isLoginPage 
      ? LoginPage(togglePage: togglePage) 
      : SignupPage(togglePage: togglePage);
  }
}