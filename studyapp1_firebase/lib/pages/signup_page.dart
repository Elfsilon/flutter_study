import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studyapp1_firebase/helpers/messenger_utils.dart';
import 'package:studyapp1_firebase/helpers/wrappers.dart';
import 'package:studyapp1_firebase/layouts/signup_layout.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({ Key? key, required this.togglePage }) : super(key: key);

  final Function() togglePage;

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailEditingController.dispose();
    passwordEditingController.dispose();
  }

  Future<UserCredential?> signUpWithFirebase(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      MessengerUtils.showSnackBar(context, e.message);
    } catch (e) {
      MessengerUtils.showSnackBar(context, "Something went wrong. Try again later");
    }
    return null;
  }

  void onSubmit() async {
    String email = emailEditingController.text.trim();
    String password = passwordEditingController.text.trim();
    await withFullscreenProgressIndicator<UserCredential?>(
      context, 
      () => signUpWithFirebase(email, password)
    );
    widget.togglePage();
  }

  @override
  Widget build(BuildContext context) {
    return SignupLayout(
      formKey: _formKey,
      emailEditingController: emailEditingController,
      passwordEditingController: passwordEditingController,
      onSubmit: onSubmit,
      togglePage: widget.togglePage,
    );
  }
}