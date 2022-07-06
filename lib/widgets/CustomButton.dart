import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.buttonName,
    required this.onPressed,
  }) : super(key: key);

  final String buttonName;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: kRodeoDust,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )),
        child: Text(
          buttonName,
          style: kButtonTextStyle,
        ),
      ),
    );
  }
}
