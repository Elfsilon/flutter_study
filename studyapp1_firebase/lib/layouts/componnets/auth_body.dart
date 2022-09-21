import 'package:flutter/material.dart';

class AuthLayoutConstants {
  static const double titleBottomGap = 12.0;
  static const double descriptionBottomGap = 12.0;
  static const double formGap = 16.0;
  static const double rowGap = 4.0;
  static const double layoutHorizontalPadding = 50.0;
}

class AuthBody extends StatelessWidget {
  const AuthBody({ 
    Key? key, 
    required this.title, 
    required this.formKey,
    required this.submitButtonText,
    required this.onSubmit,
    required this.children,
    this.description,
    this.subscription,
    this.subscriptionButton,
    this.extraChild,
  }) : super(key: key);

  final String title;
  final String? description;
  final String? subscription;
  final TextButton? subscriptionButton;
  final GlobalKey<FormState> formKey;
  final String submitButtonText;
  final Function onSubmit;
  final List<Widget> children;
  final Widget? extraChild;

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
            if (description != null) Text(
              description as String,
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AuthLayoutConstants.descriptionBottomGap),
            Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: children.length,
                    separatorBuilder: (context, index) => const SizedBox(height: AuthLayoutConstants.formGap),
                    itemBuilder: (context, index) => children[index],
                  ),
                  const SizedBox(height: AuthLayoutConstants.formGap),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          onSubmit();
                        }
                      },
                      child: Text(submitButtonText),
                    ),
                  ),
                ],
              ),
            ),
            if (subscription != null && subscriptionButton != null) Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(subscription as String),
                const SizedBox(width: AuthLayoutConstants.rowGap),
                subscriptionButton as TextButton,
              ],
            ),
            if (extraChild != null) extraChild as Widget,
          ],
        ),
      ),
    );
  }
}