import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '/widgets/CustomButton.dart';
import '/widgets/CustomTextField.dart';
import '../constants.dart';
import '../utilities/movie_data.dart';

class AddWatchedScreen extends StatefulWidget {
  static String id = 'AddWatchedScreen';

  const AddWatchedScreen({Key? key}) : super(key: key);

  @override
  State<AddWatchedScreen> createState() => _AddWatchedScreenState();
}

class _AddWatchedScreenState extends State<AddWatchedScreen> {
  File? image;
  String? movieTitle;
  bool checkboxValue = false;

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
            CheckboxListTile(
              title: const Text(
                'Favorite',
                style: TextStyle(
                  color: kIndianTan,
                  fontWeight: FontWeight.bold,
                ),
              ),
              value: checkboxValue,
              onChanged: (value) {
                setState(() {
                  checkboxValue = value!;
                });
              },
              activeColor: kIndianTan,
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
                if (image == null) {
                  SnackBar snackBar = SnackBar(
                    content: const Text('Please add an image'),
                    action: SnackBarAction(
                      label: 'Add',
                      onPressed: () => pickImage(),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                Provider.of<MovieData>(context, listen: false).addMovie(
                  movieTitle!,
                  FileImage(image!),
                  kWatched,
                );
                if (checkboxValue == true) {
                  Provider.of<MovieData>(context, listen: false).addMovie(
                    movieTitle!,
                    FileImage(image!),
                    kFavorite,
                  );
                }
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
