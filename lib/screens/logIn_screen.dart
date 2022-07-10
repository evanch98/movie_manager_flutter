// Importing required packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/screens/main_screen.dart';

// Importing required modules
import '../constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

/*
* LogInScreen is a StatefulWidget that allows users to log in their account.
* LogInScreen consists of CustomTextField and CustomButton, and they can be
* found in "./lib/widgets/." The logo is wrapped in a Hero widget for animation.
*/
class LogInScreen extends StatefulWidget {
  static String id = 'LogInScreen';

  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _auth = FirebaseAuth.instance;

  late String _email;
  late String _password;
  late SnackBar _snackBar;

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
              buttonName: 'Log In',
              onPressed: () async {
                try {
                  final newUser = await _auth.signInWithEmailAndPassword(
                    email: _email,
                    password: _password,
                  );
                  _snackBar = const SnackBar(
                    content: Text('Logged in successfully.'),
                  );
                  Navigator.pushNamed(context, MainScreen.id);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    _snackBar = const SnackBar(
                      content: Text('No user exists with this email'),
                      backgroundColor: Colors.red,
                    );
                  } else if (e.code == 'wrong-password') {
                    _snackBar = const SnackBar(
                      content: Text('Incorrect Password.'),
                      backgroundColor: Colors.red,
                    );
                  } else {
                    _snackBar = const SnackBar(
                      content: Text('Something went wrong'),
                      backgroundColor: Colors.red,
                    );
                  }
                  ScaffoldMessenger.of(context).showSnackBar(_snackBar);
                }
              },
            ),
          ],
        ),
      ),
    ));
  }
}
