import 'package:flutter/material.dart';
import 'package:studyapp1_firebase/helpers/validator.dart';
import 'package:studyapp1_firebase/layouts/componnets/auth_body.dart';

class SignupLayout extends StatelessWidget {
  const SignupLayout({ 
    Key? key ,
    required this.formKey,
    required this.emailEditingController,
    required this.passwordEditingController,
    required this.onSubmit,
    required this.togglePage,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController emailEditingController;
  final TextEditingController passwordEditingController;
  final Function onSubmit;
  final Function() togglePage;
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: AuthBody(
        formKey: formKey, 
        title: "Sign up", 
        subscription: "Already have an account?", 
        subscriptionButton: TextButton(
          onPressed: togglePage, 
          child: const Text("Log in"),
        ), 
        submitButtonText: "Sign up",
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
          TextFormField(
            controller: passwordEditingController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.visiblePassword,
            decoration: const InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
            validator: (value) => Validator.password(value),
          ),
        ],
      ),
    );
  }
}