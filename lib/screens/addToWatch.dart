import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_manager_flutter/constants.dart';
import 'package:movie_manager_flutter/utilities/movie_data.dart';
import 'package:movie_manager_flutter/widgets/CustomButton.dart';
import 'package:movie_manager_flutter/widgets/CustomTextField.dart';
import 'package:provider/provider.dart';

class AddToWatchScreen extends StatefulWidget {
  static String id = 'AddToWatchScreen';

  const AddToWatchScreen({Key? key}) : super(key: key);

  @override
  State<AddToWatchScreen> createState() => _AddToWatchScreenState();
}

class _AddToWatchScreenState extends State<AddToWatchScreen> {
  late File image;
  String? movieTitle;

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() => this.image = imageTemporary);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPlatinum,
      appBar: AppBar(
        title: const Text('Add To Watch'),
        backgroundColor: kIndianTan,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'images/mm.png',
              width: kLogoSize,
              height: kLogoSize,
            ),
            const SizedBox(
              height: 17.0,
            ),
            const Text(
              'Movie Manager',
              style: kTitleTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 70.0,
            ),
            CustomTextField(
              labelText: 'Movie Title',
              passwordField: false,
              onChanged: (String newValue) {
                movieTitle = newValue;
              },
            ),
            const SizedBox(
              height: 17.0,
            ),
            TextButton(
              onPressed: () => pickImage(),
              child: const Text(
                '+ Add Image',
                style: kAddImageTextStyle,
              ),
            ),
            const SizedBox(
              height: 17.0,
            ),
            CustomButton(
                buttonName: 'Add',
                onPressed: () {
                  Provider.of<MovieData>(context, listen: false).addToWatch(
                    movieTitle!,
                    Image.file(
                      image,
                      fit: BoxFit.fitHeight,
                    ),
                  );
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
