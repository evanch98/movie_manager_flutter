// Importing required packages
import 'package:flutter/material.dart';

// Importing required modules
import '/widgets/custom_list_tile.dart';
import '../constants.dart';
import '../screens/about_screen.dart';
import '../screens/help_screen.dart';
import '../screens/welcome_screen.dart';

/*
* The CustomDrawer is a StatelessWidget, and it will be used in the MainScreen's
* Scaffold widget. It is mostly a normal Drawer with minor custom changes.
*/
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: kRodeoDust,
          ),
          child: Center(
            // To display the logo on DrawerHeader().
            child: Hero(
              tag: 'logo',
              child: Image.asset('images/mm.png'),
            ),
          ),
        ),
        // To navigate to WelcomeScreen().
        CustomListTile(
          icon: Icons.home,
          iconSize: 22.0,
          title: 'Home',
          titleTextStyle: kDrawerTitleTextStyle,
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, WelcomeScreen.id);
          },
        ),
        // To navigate to HelpScreen().
        CustomListTile(
          icon: Icons.help,
          iconSize: 22.0,
          title: 'Help',
          titleTextStyle: kDrawerTitleTextStyle,
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, HelpScreen.id);
          },
        ),
        // To navigate to AboutScreen().
        CustomListTile(
          icon: Icons.info,
          iconSize: 22.0,
          title: 'About',
          titleTextStyle: kDrawerTitleTextStyle,
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, AboutScreen.id);
          },
        )
      ],
    ));
  }
}
