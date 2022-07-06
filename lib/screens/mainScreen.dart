import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/constants.dart';

class MainScreen extends StatelessWidget {
  static String id = 'mainScreen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPlatinum,
      appBar: AppBar(
        backgroundColor: kIndianTan,
        title: Row(
          children: <Widget>[
            Image.asset(
              'images/mmText.png',
              width: 80.0,
              height: 80.0,
            ),
            const SizedBox(
              width: 17.0,
            ),
            const Text(
              'Movie Manager',
              style: TextStyle(color: kPlatinum),
            ),
          ],
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: kPlatinum,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kIndianTan,
        child: const Icon(
          Icons.add,
          color: kPlatinum,
        ),
      ),
    );
  }
}
