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
          children: [
            Image.asset(
              'images/mmplatinum.png',
              width: 55.0,
              height: 55.0,
            ),
            const Text(
              'Movie Manager',
              style: TextStyle(color: kPlatinum),
            ),
          ],
        ),
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
