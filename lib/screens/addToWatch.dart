import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/constants.dart';
import 'package:movie_manager_flutter/widgets/CustomTextField.dart';

class AddToWatchScreen extends StatelessWidget {
  static String id = 'AddToWatchScreen';

  const AddToWatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String movieTitle;

    return Scaffold(
      backgroundColor: kPlatinum,
      appBar: AppBar(
        title: const Text('Add To Watch'),
        backgroundColor: kIndianTan,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
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
              labelText: 'Movie Title',
              passwordField: false,
              onChanged: (String newValue) {
                movieTitle = newValue;
                print(movieTitle);
              },
            ),
          ],
        ),
      ),
    );
  }
}
