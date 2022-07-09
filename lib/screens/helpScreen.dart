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
        child: ListView(
          children: [
            const Text(
              'The Movie Manager application is for making lists of movies you '
              'are planning to watch or have already watched. You can also '
              'add your favorite movies.',
              style: kHelpParaTextStyle,
            ),
            const SizedBox(
              height: 17.0,
            ),
            Text(
              'Instructions',
              style: kTitleTextStyle,
            ),
            const SizedBox(
              height: 17.0,
            ),
            const Text(
              'You can add movies by pressing a FloatingActionButton at the '
              'bottom right of the screen. Three ActionButtons will appear, '
              'and choose one that matches the list you want to add. For '
              'example, the heart-shaped icon will add to the favorite movie'
              ' list.\nWhen you press one of the ActionButtons, it will lead to '
              'a screen you choose. The screen may be "Add To Watch Movie," '
              '"Add Watched Movie," or "Add Favorite Movie." The movie Title'
              ' is optional, but the image is required for each movie card. '
              '\nIn "Add Watched Movie," you can check the "Favorite" checkbox '
              'to add to the favorite movie list.\nYou can delete a movie '
              'card from each list by long-pressing the card you want to '
              'remove.',
              style: kHelpParaTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
