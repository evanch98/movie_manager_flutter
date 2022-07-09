import 'package:flutter/material.dart';

import '../constants.dart';

class HelpScreen extends StatelessWidget {
  static String id = 'HelpScreen';

  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPlatinum,
      appBar: AppBar(
        backgroundColor: kIndianTan,
        title: const Text('Help'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              'Instructions',
              style: kTitleTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
