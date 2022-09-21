import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studyapp1_firebase/helpers/messenger_utils.dart';
import 'package:studyapp1_firebase/helpers/wrappers.dart';
import 'package:studyapp1_firebase/layouts/login_layout.dart';
import 'package:studyapp1_firebase/pages/reset_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key, required this.togglePage }) : super(key: key);

  final Function() togglePage;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailEditingController.dispose();
    passwordEditingController.dispose();
  }

  Future<UserCredential?> authWithFirebase(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, 
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      MessengerUtils.showSnackBar(context, e.message);
    }
    return null;
  }

  void onSubmit() async {
    if (_formKey.currentState!.validate()) {
      String email = emailEditingController.text.trim();
      String password = passwordEditingController.text;
      await withFullscreenProgressIndicator<UserCredential?>(
        context,
        () async => authWithFirebase(email, password)
      );
    }
  }

  void onForgotPassword() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ResetPasswordPage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return LoginLayout(
      formKey: _formKey,
      emailEditingController: emailEditingController,
      passwordEditingController: passwordEditingController,
      onSubmit: onSubmit,
      onForgotPassword: onForgotPassword,
      togglePage: widget.togglePage,
    );
  }
}