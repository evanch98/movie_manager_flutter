// Importing required packages
import 'package:flutter/material.dart';

// Importing required modules
import '../constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

/*
* LogInScreen is a StatelessWidget that allows users to log in their account.
* LogInScreen consists of CustomTextField and CustomButton, and they can be
* found in "./lib/widgets/." The logo is wrapped in a Hero widget for animation.
*/
class LogInScreen extends StatelessWidget {
  static String id = 'LogInScreen';

  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPlatinum,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'logo',
              child: Image.asset(
                'images/mm.png',
                width: kLogoSize,
                height: kLogoSize,
              ),
            ),
            const SizedBox(
              height: 17.0,
            ),
            Text(
              'Movie Manager',
              style: kTitleTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 70.0,
            ),
            CustomTextField(
              labelText: 'Email',
              passwordField: false,
              onChanged: (newValue) {},
            ),
            const SizedBox(
              height: 17.0,
            ),
            CustomTextField(
              labelText: 'Password',
              passwordField: true,
              onChanged: (newValue) {},
            ),
            const SizedBox(
              height: 17.0,
            ),
            CustomButton(buttonName: 'Log In', onPressed: () {}),
          ],
        ),
      ),
    ));
  }
}
