// Importing required packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// Importing required modules
import '/constants.dart';
import '/screens/about_screen.dart';
import '/screens/add_favorite.dart';
import '/screens/add_to_watch.dart';
import '/screens/add_watched.dart';
import '/screens/help_screen.dart';
import '/screens/loading_screen.dart';
import '/screens/logIn_screen.dart';
import '/screens/main_screen.dart';
import '/screens/register_screen.dart';
import '/screens/welcome_screen.dart';
import '/utilities/movie_data.dart';
import 'screens/username_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
*     LoadingScreen()      => A screen that will appear while checking internet
*                             connection.
*     WelcomeScreen()      => A screen that allows users to navigate to Log In
*                             and Registration screens.
*     LogInScreen()        => A screen that allows users to log in. It will lead
*                             to MainScreen().
*     RegistrationScreen() => A screen that allows users to register. It will
*                             lead to LogInScreen().
*     UsernameScreen()     => A screen that allows users to update their
*                             username.
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
        initialRoute: LoadingScreen.id,
        routes: {
          LoadingScreen.id: (context) => const LoadingScreen(),
          WelcomeScreen.id: (context) => const WelcomeScreen(),
          LogInScreen.id: (context) => const LogInScreen(),
          RegisterScreen.id: (context) => const RegisterScreen(),
          UsernameScreen.id: (context) => const UsernameScreen(),
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
