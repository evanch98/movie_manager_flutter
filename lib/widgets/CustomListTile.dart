import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/constants.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.icon,
    required this.iconSize,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final double iconSize;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: iconSize,
        color: kIndianTan,
      ),
      title: Text(
        title,
        style: kMainScreenTitleTextStyle,
      ),
      onTap: onTap,
    );
  }
}
