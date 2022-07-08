import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/constants.dart';
import 'package:movie_manager_flutter/screens/addToWatch.dart';
import 'package:movie_manager_flutter/utilities/movie_data.dart';
import 'package:movie_manager_flutter/widgets/ActionButton.dart';
import 'package:movie_manager_flutter/widgets/CustomDrawer.dart';
import 'package:movie_manager_flutter/widgets/CustomListTile.dart';
import 'package:movie_manager_flutter/widgets/expandableFab/ExpandableFab.dart';
import 'package:provider/provider.dart';

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
            onPressed: () {},
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
          children: <Widget>[
            const Text(
              'Hello, anonymous',
              style: kGreetingTextStyle,
              textAlign: TextAlign.center,
            ),
            const CustomListTile(
              icon: Icons.schedule,
              iconSize: kMainScreenTitleIconSize,
              title: 'To Watch',
              titleTextStyle: kMainScreenTitleTextStyle,
            ),
            const SizedBox(
              height: 17.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: Provider.of<MovieData>(context).toWatch,
              ),
            ),
            const Divider(),
            const CustomListTile(
              icon: Icons.favorite,
              iconSize: kMainScreenTitleIconSize,
              title: 'My Favorite',
              titleTextStyle: kMainScreenTitleTextStyle,
            ),
            const Divider(),
            const CustomListTile(
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
