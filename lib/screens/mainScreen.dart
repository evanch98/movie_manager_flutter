import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/constants.dart';
import 'package:movie_manager_flutter/widgets/ActionButton.dart';
import 'package:movie_manager_flutter/widgets/CustomListTile.dart';
import 'package:movie_manager_flutter/widgets/expandableFab/ExpandableFab.dart';

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
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: kPlatinum,
            ),
          )
        ],
      ),
      // ExpandableFab allows expansion of FloatingActionButton.
      floatingActionButton: ExpandableFab(
        distance: 112.0,
        children: [
          ActionButton(
            icon: const Icon(Icons.schedule),
            onPressed: () {},
          ),
          ActionButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {},
          ),
          ActionButton(
            icon: const Icon(Icons.done),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        child: ListView(
          children: const <Widget>[
            CustomListTile(
              icon: Icons.schedule,
              title: 'To Watch',
            ),
            Divider(),
            CustomListTile(
              icon: Icons.favorite,
              title: 'My Favorite',
            ),
            Divider(),
            CustomListTile(
              icon: Icons.done,
              title: 'Watched',
            ),
          ],
        ),
      ),
    );
  }
}
