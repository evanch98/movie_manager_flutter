import 'package:flutter/material.dart';

import '/widgets/custom_list_tile.dart';
import '../constants.dart';
import '../screens/about_screen.dart';
import '../screens/help_screen.dart';
import '../screens/welcome_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: kRodeoDust,
            border: Border(
              bottom: Divider.createBorderSide(
                context,
                color: kRodeoDust,
                width: 2.0,
              ),
            ),
          ),
          child: Center(
            child: Hero(
              tag: 'logo',
              child: Image.asset('images/mm.png'),
            ),
          ),
        ),
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
