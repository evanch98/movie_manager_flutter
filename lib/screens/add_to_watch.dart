// Importing required dart files
import 'dart:io';

// Importing required packages
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

// Importing required modules
import '/widgets/custom_button.dart';
import '/widgets/custom_text_field.dart';
import '../constants.dart';
import '../utilities/movie_data.dart';

/*
* AddToWatchScreen is a StatefulWidget that allows users to add their favorite
* movies.
*/
class AddToWatchScreen extends StatefulWidget {
  static String id = 'AddToWatchScreen';

  const AddToWatchScreen({Key? key}) : super(key: key);

  @override
  State<AddToWatchScreen> createState() => _AddToWatchScreenState();
}

class _AddToWatchScreenState extends State<AddToWatchScreen> {
  File? image; // image file
  String? movieTitle; // movie title

  // To allow users to pick images from the gallery.
  // The function is implemented with the help of the image_picker package.
  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() => this.image = imageTemporary);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kPlatinum,
      appBar: AppBar(
        title: const Text('Add To Watch Movie'),
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
            Text(
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
                // The following codes will add movie to the server with the
                // help of the MovieData class.
                // Provider class may be redundant in this case.
                // Check lib/utilities/movie_data.dart for more information on
                // how the method addMovie() is implemented.
                Provider.of<MovieData>(context, listen: false).addMovie(
                  movieTitle!,
                  image!,
                  'to watch',
                );
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
