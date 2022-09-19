import 'package:firebase_auth/helpers/validator.dart';
import 'package:firebase_auth/layouts/componnets/auth_body.dart';
import 'package:flutter/material.dart';

class SignupLayout extends StatelessWidget {
  SignupLayout({ Key? key }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context){
    return AuthBody(
      formKey: _formKey, 
      title: "Sign up", 
      subscription: "Already have an account?", 
      subscriptionButton: TextButton(
        onPressed: () => Navigator.pushNamed(context, "/login"), 
        child: const Text("Log in"),
      ), 
      children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(Icons.person),
          ),
          validator: (value) => Validator.email(value),
        ),
        TextFormField(
          keyboardType: TextInputType.visiblePassword,
          decoration: const InputDecoration(
            hintText: "Password",
            prefixIcon: Icon(Icons.lock),
          ),
          obscureText: true,
          validator: (value) => Validator.password(value),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print("correct");
              }
              print("incorrect");
            },
            child: const Text("Sign up"),
          ),
        ),
      ],
    );
  }
}