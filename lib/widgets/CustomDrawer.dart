import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/constants.dart';
import 'package:movie_manager_flutter/widgets/CustomListTile.dart';

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
            child: Image.asset('images/mm.png'),
          ),
        ),
        const CustomListTile(
          icon: Icons.home,
          iconSize: 22.0,
          title: 'Home',
          titleTextStyle: kDrawerTitleTextStyle,
        ),
        const CustomListTile(
          icon: Icons.help,
          iconSize: 24.0,
          title: 'Help',
          titleTextStyle: kDrawerTitleTextStyle,
        ),
        const CustomListTile(
          icon: Icons.info,
          iconSize: 22.0,
          title: 'About',
          titleTextStyle: kDrawerTitleTextStyle,
        )
      ],
    ));
  }
}
