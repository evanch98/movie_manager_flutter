import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/constants.dart';

class LogInScreen extends StatelessWidget {
  static String id = 'LogInScreen';

  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPlatinum,
    ));
  }
}
