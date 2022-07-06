import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/screens/logInScreen.dart';
import 'package:movie_manager_flutter/screens/welcome_screen.dart';

void main() {
  runApp(const MovieManager());
}

class MovieManager extends StatelessWidget {
  const MovieManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LogInScreen.id: (context) => const LogInScreen(),
      },
    );
  }
}
