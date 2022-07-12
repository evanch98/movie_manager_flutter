// Importing required packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Importing required modules
import '/screens/username_screen.dart';
import '../constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

/*
* RegisterScreen is a StatefulWidget that allows users to log in their account.
* LogInScreen consists of CustomTextField and CustomButton, and they can be
* found in "./lib/widgets/." The logo is wrapped in a Hero widget for animation.
*/
class RegisterScreen extends StatefulWidget {
  static String id = 'RegisterScreen';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;

  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
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
              onChanged: (newValue) {
                setState(() {
                  _email = newValue;
                });
              },
            ),
            const SizedBox(
              height: 17.0,
            ),
            CustomTextField(
              labelText: 'Password',
              passwordField: true,
              onChanged: (newValue) {
                setState(() {
                  _password = newValue;
                });
              },
            ),
            const SizedBox(
              height: 17.0,
            ),
            CustomButton(
                buttonName: 'Register',
                onPressed: () async {
                  // To allow users to register an account.
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                      email: _email,
                      password: _password,
                    );
                    if (newUser != null) {
                      SnackBar snackBar = const SnackBar(
                        content: Text(
                          'Successfully registered',
                        ),
                      );
                      if (!mounted) return;
                      // If nothing bad happens, will navigate to
                      // UsernameScreen()
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pushNamed(context, UsernameScreen.id);
                    }
                    // To catch any allow that will come while registering.
                  } on FirebaseAuthException catch (e) {
                    SnackBar snackBar = const SnackBar(
                      content: Text('Something went wrong. Please try again'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }),
          ],
        ),
      ),
    ));
  }
}
