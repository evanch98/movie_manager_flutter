// Importing required packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Importing required modules
import '/screens/add_favorite.dart';
import '/screens/add_to_watch.dart';
import '/screens/add_watched.dart';
import '../constants.dart';
import '../widgets/action_button.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/custom_list_tile.dart';
import '../widgets/expandableFab/expandable_fab.dart';
import '../widgets/movie_list.dart';

/*
* The MainScreen is a StatelessWidget, and it is a main screen users will mostly
* interact with. The MainScreen consists of several custom widgets all of which
* can be found in "./lib/widgets/." Users can navigate to several screens from
* the MainScreen, and the screens can be found in "./lib/screens/."
*/
class MainScreen extends StatefulWidget {
  static String id = 'mainScreen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

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
          // To navigate to AddToWatchScreen
          ActionButton(
            icon: const Icon(Icons.schedule),
            onPressed: () {
              Navigator.pushNamed(context, AddToWatchScreen.id);
            },
          ),
          // To navigate to AddFavoriteScreen
          ActionButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.pushNamed(context, AddFavoriteScreen.id);
            },
          ),
          // To navigate to AddWatchedScreen
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
          children: <Widget>[
            // This widget is to greet users with their name.
            Text(
              'Hello, ${loggedInUser.email}',
              style: kGreetingTextStyle,
              textAlign: TextAlign.center,
            ),
            // This widget is to display the title of "To Watch" movie list.
            const CustomListTile(
              icon: Icons.schedule,
              iconSize: kMainScreenTitleIconSize,
              title: 'To Watch',
              titleTextStyle: kMainScreenTitleTextStyle,
            ),
            const SizedBox(
              height: 17.0,
            ),
            // This widget is to display the list of "to-watch" movie card.
            // The movie cards will be displayed horizontally.
            // For more information on how the list is constructed, check the
            // MovieList widget in ./lib/widgets/movie_list.dart.
            const MovieList(
              list: kToWatch,
            ),
            const Divider(),
            // This widget is to display the title of "Favorite" movie list.
            const CustomListTile(
              icon: Icons.favorite,
              iconSize: kMainScreenTitleIconSize,
              title: 'My Favorite',
              titleTextStyle: kMainScreenTitleTextStyle,
            ),
            const SizedBox(
              height: 17.0,
            ),
            // This widget is to display the list of "favorite" movie card.
            // The movie cards will be displayed horizontally.
            // For more information on how the list is constructed, check the
            // MovieList widget in ./lib/widgets/movie_list.dart.
            const MovieList(
              list: kFavorite,
            ),
            const Divider(),
            // This widget is to display the title of "Watched" movie list.
            const CustomListTile(
              icon: Icons.done,
              iconSize: kMainScreenTitleIconSize,
              title: 'Watched',
              titleTextStyle: kMainScreenTitleTextStyle,
            ),
            const SizedBox(
              height: 17.0,
            ),
            // This widget is to display the list of "watched" movie card.
            // The movie cards will be displayed horizontally.
            // For more information on how the list is constructed, check the
            // MovieList widget in ./lib/widgets/movie_list.dart.
            const MovieList(
              list: kWatched,
            ),
          ],
        ),
      ),
    );
  }
}
