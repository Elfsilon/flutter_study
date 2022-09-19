import 'package:flutter/material.dart';

class AuthLayoutConstants {
  static const double titleBottomGap = 24.0;
  static const double formGap = 16.0;
  static const double rowGap = 4.0;
  static const double layoutHorizontalPadding = 50.0;
}

class AuthBody extends StatelessWidget {
  const AuthBody({ 
    Key? key, 
    required this.title, 
    required this.subscription,
    required this.subscriptionButton,
    required this.formKey,
    required this.children,
  }) : super(key: key);

  final String title;
  final String subscription;
  final TextButton subscriptionButton;
  final GlobalKey<FormState> formKey;
  final List<Widget> children;

  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AuthLayoutConstants.layoutHorizontalPadding
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: AuthLayoutConstants.titleBottomGap),
            Form(
              key: formKey,
              child: ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: children.length,
                separatorBuilder: (context, index) => const SizedBox(height: AuthLayoutConstants.formGap),
                itemBuilder: (context, index) => children[index],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(subscription),
                const SizedBox(width: AuthLayoutConstants.rowGap),
                subscriptionButton,
              ],
            ),
          ],
        ),
      ),
    );
  }
}