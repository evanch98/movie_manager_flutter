import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '/constants.dart';
import '/screens/aboutScreen.dart';
import '/screens/addFavorite.dart';
import '/screens/addToWatch.dart';
import '/screens/addWatched.dart';
import '/screens/helpScreen.dart';
import '/screens/logInScreen.dart';
import '/screens/mainScreen.dart';
import '/screens/registerScreen.dart';
import '/screens/welcome_screen.dart';
import '/utilities/movie_data.dart';

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
          textTheme: GoogleFonts.robotoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        initialRoute: MainScreen.id,
        routes: {
          WelcomeScreen.id: (context) => const WelcomeScreen(),
          LogInScreen.id: (context) => const LogInScreen(),
          RegisterScreen.id: (context) => const RegisterScreen(),
          MainScreen.id: (context) => const MainScreen(),
          AddToWatchScreen.id: (context) => const AddToWatchScreen(),
          AddWatchedScreen.id: (context) => const AddWatchedScreen(),
          AddFavoriteScreen.id: (context) => const AddFavoriteScreen(),
          HelpScreen.id: (context) => const HelpScreen(),
          AboutScreen.id: (context) => const AboutScreen(),
        },
      ),
    );
  }
}
