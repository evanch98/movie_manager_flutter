// Importing required packages
import 'package:flutter/material.dart';

// Importing required modules
import '../constants.dart';

/*
 * ActionButton widget is used in custom ExpandableFab.
 * The widget has two parameters.
 * onPressed: Accept VoidCallback.
 * icon: Accept icon to display on the button.
 */
@immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: kRodeoDust,
      elevation: 4.0,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: kPlatinum,
      ),
    );
  }
}
