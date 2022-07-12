// Importing required packages
import 'package:flutter/material.dart';

// Importing required modules
import '../constants.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.icon,
    required this.iconSize,
    required this.title,
    required this.titleTextStyle,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final double iconSize;
  final String title;
  final TextStyle titleTextStyle;
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
        style: titleTextStyle,
      ),
      onTap: onTap,
    );
  }
}
