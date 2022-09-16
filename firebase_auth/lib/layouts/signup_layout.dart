import 'package:firebase_auth/helpers/validator.dart';
import 'package:flutter/material.dart';

class SignupLayout extends StatelessWidget {
  SignupLayout({ Key? key }) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Sign up"),
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => Validator.email(value),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) => Validator.password(value),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("correct");
                      }
                      print("incorrect");
                    },
                    child: const Text("Login"),
                  ),
                  const Text("Already have an account?"),
                  TextButton(onPressed: () => Navigator.pushNamed(context, "/login"), child: const Text("Log in"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}