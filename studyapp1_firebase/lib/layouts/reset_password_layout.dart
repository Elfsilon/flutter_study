import 'package:flutter/material.dart';
import 'package:studyapp1_firebase/helpers/validator.dart';
import 'package:studyapp1_firebase/layouts/componnets/auth_body.dart';

class ResetPasswordLayout extends StatelessWidget {
  const ResetPasswordLayout({ 
    Key? key,
    required this.formKey,
    required this.emailEditingController,
    required this.onSubmit,
    required this.togglePage,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController emailEditingController;
  final Function() onSubmit;
  final Function() togglePage;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: AuthBody(
        formKey: formKey, 
        title: "Reset password", 
        description: "We'll send instructions to your email address",
        submitButtonText: "Reset password",
        onSubmit: onSubmit,
        children: [
          TextFormField(
            controller: emailEditingController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.person),
            ),
            validator: (value) => Validator.email(value),
          ),
        ],
      ),
    );
  }
}