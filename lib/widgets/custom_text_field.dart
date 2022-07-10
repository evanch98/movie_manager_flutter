import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.passwordField,
    required this.onChanged,
  }) : super(key: key);

  final String labelText;
  final bool passwordField;
  final Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: kLabelTextStyle,
          ),
          TextField(
            obscureText: passwordField,
            keyboardType:
                labelText == 'Email' ? TextInputType.emailAddress : null,
            style: const TextStyle(fontSize: 22.0, color: kIndianTan),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
