import 'package:flutter/material.dart';

import '/screens/addToWatch.dart';
import '/screens/addWatched.dart';
import '../constants.dart';
import '../widgets/ActionButton.dart';
import '../widgets/CustomDrawer.dart';
import '../widgets/CustomListTile.dart';
import '../widgets/MovieList.dart';
import '../widgets/expandableFab/ExpandableFab.dart';

class MainScreen extends StatelessWidget {
  static String id = 'mainScreen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPlatinum,
      appBar: AppBar(
        backgroundColor: kIndianTan,
        title: Row(
          children: <Widget>[
            Image.asset(
              'images/mmText.png',
              width: 80.0,
              height: 80.0,
            ),
            const SizedBox(
              width: 17.0,
            ),
            const Text(
              'Movie Manager',
              style: TextStyle(color: kPlatinum),
            ),
          ],
        ),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      // ExpandableFab allows expansion of FloatingActionButton.
      floatingActionButton: ExpandableFab(
        distance: 112.0,
        children: [
          ActionButton(
            icon: const Icon(Icons.schedule),
            onPressed: () {
              Navigator.pushNamed(context, AddToWatchScreen.id);
            },
          ),
          ActionButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {},
          ),
          ActionButton(
            icon: const Icon(Icons.done),
            onPressed: () {
              Navigator.pushNamed(context, AddWatchedScreen.id);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 12.0,
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            Text(
              'Hello, anonymous',
              style: kGreetingTextStyle,
              textAlign: TextAlign.center,
            ),
            CustomListTile(
              icon: Icons.schedule,
              iconSize: kMainScreenTitleIconSize,
              title: 'To Watch',
              titleTextStyle: kMainScreenTitleTextStyle,
            ),
            SizedBox(
              height: 17.0,
            ),
            MovieList(
              list: kToWatch,
            ),
            Divider(),
            CustomListTile(
              icon: Icons.favorite,
              iconSize: kMainScreenTitleIconSize,
              title: 'My Favorite',
              titleTextStyle: kMainScreenTitleTextStyle,
            ),
            Divider(),
            CustomListTile(
              icon: Icons.done,
              iconSize: kMainScreenTitleIconSize,
              title: 'Watched',
              titleTextStyle: kMainScreenTitleTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
