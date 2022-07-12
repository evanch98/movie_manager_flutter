import 'package:flutter/material.dart';

import '../constants.dart';

/*
* To display the information about this application. The AboutScreen widget only
* includes simple widgets such as Scaffold(), Text(), and Padding().
*/
class AboutScreen extends StatelessWidget {
  static String id = 'AboutScreen';

  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPlatinum,
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: kIndianTan,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        // Used ListView instead of Column in case the text overflow the screen
        // in smaller devices.
        child: ListView(
          children: [
            Text(
              'About',
              style: kTitleTextStyle,
            ),
            const SizedBox(
              height: 17.0,
            ),
            const Text(
              'Application name: Movie Manager\n'
              'Developed by: Kyaw Thu (Evan)\n'
              'Built with: Flutter and Dart\n'
              'Powered by: Google Firebase\n'
              'Published: 12th July 2022\n'
              'Version: 1.0.0+1',
              style: kParaTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
