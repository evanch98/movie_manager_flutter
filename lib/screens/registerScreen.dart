import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/constants.dart';
import 'package:movie_manager_flutter/widgets/CustomButton.dart';
import 'package:movie_manager_flutter/widgets/CustomTextField.dart';

class RegisterScreen extends StatelessWidget {
  static String id = 'RegisterScreen';

  const RegisterScreen({Key? key}) : super(key: key);

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
            CustomButton(buttonName: 'Register', onPressed: () {}),
          ],
        ),
      ),
    ));
  }
}
