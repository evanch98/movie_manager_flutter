// Importing required packages
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// Importing required modules
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

/*
* MovieManage class is a StatelessWidget, and it is an entry point of the
* application.
* The MaterialApp is wrapped with a ChangeNotifierProvider from the provider
* package for managing state of the application.
* In the MaterialApp, ThemeData is used to set a theme for dividerTheme and
* textTheme.
* The screen classes and its descriptions are as follow:
*     WelcomeScreen()      => A screen that allows users to navigate to Log In
*                             and Registration screens.
*     LogInScreen()        => A screen that allows users to log in. It will lead
*                             to MainScreen().
*     RegistrationScreen() => A screen that allows users to register. It will
*                             lead to LogInScreen().
*     MainScreen()         => The main screen that users will mostly interact
*                             with. From the main screen, users can navigate to
*                             several screens.
*     AddToWatchScreen()   => A screen that allows users to add movies to the
*                             to-watch-movie list. It can be navigated from
*                             the MainScreen().
*     AddWatchedScreen()   => A screen that allows users to add movies to the
*                             watched-movie list. It can be navigated from
*                             the MainScreen().
*     AddFavoriteScreen()  => A screen that allows users to add movies to the
*                             favorite-movie list. It can be navigated from
*                             the MainScreen().
*     HelpScreen()         => A screen that includes instructions for the
*                             application. It can be navigated from the
*                             MainScreen().
*     AboutScreen()        => A screen that includes information about the
*                             application. It can be navigated from the
*                             MainScreen().
*/
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
