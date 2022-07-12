// Importing required packages
import 'package:flutter/material.dart';

// Importing required modules
import '/constants.dart';
import '/screens/logIn_screen.dart';
import '/screens/register_screen.dart';
import '../widgets/custom_button.dart';

/*
* WelcomeScreen is a StatelessWidget that allows users to navigate to either
* LogInScreen or RegisterScreen. It only includes simple widgets.
*/
class WelcomeScreen extends StatelessWidget {
  static String id = 'WelcomeScreen';

  const WelcomeScreen({Key? key}) : super(key: key);

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
              CustomButton(
                buttonName: 'Log In',
                onPressed: () {
                  Navigator.pushNamed(context, LogInScreen.id);
                },
              ),
              const SizedBox(
                height: 17.0,
              ),
              CustomButton(
                buttonName: 'Register',
                onPressed: () {
                  Navigator.pushNamed(context, RegisterScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
