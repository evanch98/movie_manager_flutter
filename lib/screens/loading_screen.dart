// Importing required packages
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

// Importing required modules
import '/screens/welcome_screen.dart';
import '../constants.dart';

class LoadingScreen extends StatefulWidget {
  static String id = 'LoadingScreen';

  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  // To control animation
  late AnimationController _controller;
  // To store the status of internet connectivity
  bool _hasInternet = false;

  // This function checks the internet connectivity.
  // The function has one parameter context.
  //     context: Accept a BuildContext value.
  void _checkConnection(BuildContext context) async {
    // Change the value of hasInternet based on internet connection
    _hasInternet = await InternetConnectionChecker().hasConnection;
    if (_hasInternet) {
      // If there is an internet connection, it will navigate to the
      // WelcomeScreen.
      Navigator.pushNamed(context, WelcomeScreen.id);
    } else {
      // If there is no internet connectivity, a snackBar will be shown.
      final SnackBar snackBar = SnackBar(
        content: const ListTile(
          leading: Icon(Icons.warning),
          title: Text('No internet'),
        ),
        backgroundColor: Colors.red,
        action: SnackBarAction(
          label: 'Try again',
          onPressed: () {
            _checkConnection(context);
          },
        ),
        duration: const Duration(days: 365),
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
    _checkConnection(context);
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
