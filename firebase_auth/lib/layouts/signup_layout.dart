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
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Text(
                "Sign up",
                style: Theme.of(context).textTheme.headline6,
              ),
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
                  const SizedBox(height: 8),
                  TextFormField(
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
                      child: const Text("Login"),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                const SizedBox(width: 4),
                TextButton(onPressed: () => Navigator.pushNamed(context, "/login"), child: const Text("Log in"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}