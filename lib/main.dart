import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/constants.dart';
import 'package:movie_manager_flutter/screens/logInScreen.dart';
import 'package:movie_manager_flutter/screens/mainScreen.dart';
import 'package:movie_manager_flutter/screens/registerScreen.dart';
import 'package:movie_manager_flutter/screens/welcome_screen.dart';
import 'package:movie_manager_flutter/utilities/movie_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MovieManager());
}

class MovieManager extends StatelessWidget {
  const MovieManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieData(),
      child: MaterialApp(
        theme: ThemeData(
          dividerTheme: const DividerThemeData(
            space: 13,
            thickness: 2,
            color: kRodeoDust,
          ),
        ),
        initialRoute: MainScreen.id,
        routes: {
          WelcomeScreen.id: (context) => const WelcomeScreen(),
          LogInScreen.id: (context) => const LogInScreen(),
          RegisterScreen.id: (context) => const RegisterScreen(),
          MainScreen.id: (context) => const MainScreen(),
        },
      ),
    );
  }
}
