import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Importing required modules
import '/screens/main_screen.dart';
import '../constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

/*
* UsernameScreen is a StatefulWidget allows users to update their display name
* on firebase. Users can navigate this screen either from RegisterScreen or
* MainScreen. The username will be updated as an FirebaseAuth's display name.
*/
class UsernameScreen extends StatefulWidget {
  static String id = 'UsernameScreen';

  const UsernameScreen({Key? key}) : super(key: key);

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  // To get the static instance of FirebaseAuth.
  final _auth = FirebaseAuth.instance;

  // If the user does not type any name, the default name will be anonymous.
  String _username = 'anonymous';

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
              labelText: 'Username',
              passwordField: false,
              onChanged: (newValue) {
                // The value from the TextField will be used as an _username.
                setState(() {
                  _username = newValue;
                });
              },
            ),
            const SizedBox(
              height: 17.0,
            ),
            CustomButton(
              buttonName: 'Update',
              onPressed: () async {
                // To update the username.
                try {
                  await _auth.currentUser?.updateDisplayName(_username);
                  SnackBar snackBar = const SnackBar(
                    content: Text(
                      'Successfully updated',
                    ),
                  );
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.pushNamed(context, MainScreen.id);
                } on FirebaseAuthException catch (e) {
                  SnackBar snackBar = const SnackBar(
                    content: Text('Something went wrong. Please try again'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
            ),
          ],
        ),
      ),
    ));
  }
}
