import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studyapp1_firebase/helpers/messenger_utils.dart';
import 'package:studyapp1_firebase/helpers/wrappers.dart';
import 'package:studyapp1_firebase/layouts/reset_password_layout.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({ Key? key }) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailEditingController.dispose();
    passwordEditingController.dispose();
  }

  Future<bool> resetPasswordWithFirebase(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch(e) {
      MessengerUtils.showSnackBar(context, e.message);
    } catch (e) {
      MessengerUtils.showSnackBar(context, "Something went wrong");
    }
    return false;
  }

  void onSubmit() async {
    final String email = emailEditingController.text.trim();
    final emailIsSent = await withFullscreenProgressIndicator<bool>(
      context, 
      () => resetPasswordWithFirebase(email), 
    );
    if (emailIsSent) {
      if (mounted) {
        MessengerUtils.showSnackBar(context, "Email sent to $email");
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResetPasswordLayout(
        formKey: _formKey,
        emailEditingController: emailEditingController,
        onSubmit: onSubmit,
        togglePage: onSubmit,
      ),
    );
  }
}