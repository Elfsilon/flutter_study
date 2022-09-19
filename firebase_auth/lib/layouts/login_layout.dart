import 'package:firebase_auth/helpers/validator.dart';
import 'package:flutter/material.dart';

class LoginLayout extends StatelessWidget {
LoginLayout({ Key? key }) : super(key: key);

final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Log in",
              style: Theme.of(context).textTheme.headline6,
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) => Validator.email(value),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(onPressed: () => Navigator.pushNamed(context, "/signup"), child: const Text("Sign up")),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}