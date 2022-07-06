import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/constants.dart';

/*
CustomButton widget accepts has two parameters.
buttonName: Accepts String value as an argument and displays the value
            on the button.
onPressed: Accepts Function as an argument.
 */
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
      // to give the height value of the button.
      height: 50.0,
      child: ElevatedButton(
        onPressed: onPressed,
        // Styling the ElevatedButton widget.
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
