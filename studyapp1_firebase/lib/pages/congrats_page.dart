import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studyapp1_firebase/helpers/label.dart';
import 'package:studyapp1_firebase/helpers/messenger_utils.dart';
import 'package:studyapp1_firebase/helpers/wrappers.dart';
import 'package:studyapp1_firebase/main.dart';
import 'package:studyapp1_firebase/theme.dart';

class CongratsPage extends StatefulWidget {
  const CongratsPage({ Key? key}) : super(key: key);

  @override
  State<CongratsPage> createState() => _CongratsPageState();
}

class _CongratsPageState extends State<CongratsPage> {
  bool emailIsVerified = false;
  Timer? checkForVerifiedTimer;

  @override
  void initState() {
    super.initState();
    emailIsVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!emailIsVerified) {
      checkForVerifiedTimer = Timer.periodic(
        const Duration(seconds: 3), 
        (_) => checkIfEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    checkForVerifiedTimer?.cancel();
  }

  void checkIfEmailVerified() async {
    final user = FirebaseAuth.instance.currentUser!; 
    await user.reload();
    setState(() {
      emailIsVerified = user.emailVerified;
    });
    if (emailIsVerified) checkForVerifiedTimer?.cancel();
  }

  Future<bool> sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      return true;
    } on FirebaseAuthException catch (e) {
      MessengerUtils.showSnackBar(context, e.message);
    } catch (e) {
      MessengerUtils.showSnackBar(context, "Something went wrong");
    }
    return false;
  }

  void onClickVerify() async {
    final bool emailSent = await withFullscreenProgressIndicator(
      context,
      () => sendVerificationEmail()
    );
    if (emailSent && mounted) {
      MessengerUtils.showSnackBar(
        context,
        "Verification mail sent to ${FirebaseAuth.instance.currentUser?.email}", 
        SnackBarType.info
      );
    }
  }

  void logOut() async {
    showDialog(
      context: context, 
      barrierDismissible: true,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    try {
      await FirebaseAuth.instance.signOut();
    } finally {
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }
  }

  void onSubmit() {
    logOut();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Congratulations!",
                style: Theme.of(context).textTheme.headline6,  
              ),
              const SizedBox(height: 12),
              Text(
                "You logged in as ${FirebaseAuth.instance.currentUser?.email}",
                style: Theme.of(context).textTheme.bodyText2,  
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.center,
                  child: emailIsVerified 
                  ? const IconLabel(text: "Email verified", type: LabelType.success) 
                  : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const IconLabel(text: "Email not verified", type: LabelType.warning),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: TextButton(onPressed: onClickVerify, child: const Text("Verify")),
                      ),
                    ],
                  )
                )
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onSubmit, 
                  child: const Text("Log out")
                ),
              ),
            ],
          ),
        ),
      ) 
    );
  }
}