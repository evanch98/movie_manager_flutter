import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/constants.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: kIndianTan,
      ),
      title: Text(
        title,
        style: kMainScreenTitleTextStyle,
      ),
    );
  }
}
