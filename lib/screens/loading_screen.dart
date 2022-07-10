// Importing required packages
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '/screens/welcome_screen.dart';
// Importing required modules
import '../constants.dart';

class LoadingScreen extends StatefulWidget {
  static String id = 'LoadingScreen';

  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool hasInternet = false;

  void checkConnection(BuildContext context) async {
    hasInternet = await InternetConnectionChecker().hasConnection;
    if (hasInternet) {
      Navigator.pushNamed(context, WelcomeScreen.id);
    } else {
      SnackBar snackBar = const SnackBar(
        content: ListTile(
          leading: Icon(Icons.warning),
          title: Text('No internet connection'),
        ),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    checkConnection(context);
    return Scaffold(
      backgroundColor: kPlatinum,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          child: Image.asset(
            'images/mm.png',
            width: kLogoSize,
            height: kLogoSize,
          ),
          builder: (context, Widget? widget) {
            return Transform.rotate(
              angle: _controller.value * 6.3,
              child: widget,
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
