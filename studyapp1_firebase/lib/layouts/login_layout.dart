import 'package:flutter/material.dart';
import 'package:studyapp1_firebase/helpers/validator.dart';
import 'package:studyapp1_firebase/layouts/componnets/auth_body.dart';
import 'package:studyapp1_firebase/theme.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({ 
    Key? key, 
    required this.formKey,
    required this.emailEditingController,
    required this.passwordEditingController,
    required this.onSubmit,
    required this.onForgotPassword,
    required this.togglePage,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController emailEditingController;
  final TextEditingController passwordEditingController;
  final Function() onSubmit;
  final Function() onForgotPassword;
  final Function() togglePage;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: AuthBody(
        formKey: formKey, 
        title: "Log in", 
        subscription: "Don't have an account?", 
        subscriptionButton: TextButton(
          onPressed: togglePage,
          child: const Text("Sign up")
        ),
        submitButtonText: "Log in",
        onSubmit: onSubmit,
        extraChild: SizedBox(
          width: double.infinity,
          child: Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: onForgotPassword,
              child: const Text(
                "Forgot password?",
                style: TextStyle(
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ),
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
            keyboardType: TextInputType.visiblePassword,
            decoration: const InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
          ),
        ],
      ),
    );
  }
}