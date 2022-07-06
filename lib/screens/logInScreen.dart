import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/constants.dart';
import 'package:movie_manager_flutter/widgets/CustomButton.dart';
import 'package:movie_manager_flutter/widgets/CustomTextField.dart';

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
            Image.asset(
              'images/mm.png',
              width: kLogoSize,
              height: kLogoSize,
            ),
            const SizedBox(
              height: 17.0,
            ),
            const Text(
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
            ),
            const SizedBox(
              height: 17.0,
            ),
            CustomTextField(
              labelText: 'Password',
              passwordField: true,
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
