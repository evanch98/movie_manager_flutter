import 'dart:io';

// Importing required packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

// Importing required modules
import '../constants.dart';

/* The MovieData class has three lists. They are toWatch movie list, watched
 * movie list, and favorite movie list.
 * The method addMovie accepts three parameters movieTitle, image, and list.
 *     movieTitle: String value, and for the name of the movie.
 *     image: File value, and for the image of the movie.
 *     list: String value, and to identify which list the movie should be added.
 *     The movieTitle and image is stored in the movie and added to the
 *     appropriate list specified by list parameter.
*/
class MovieData extends ChangeNotifier {
  String? _imageURL; // to store the download link for the image from the
  // firebase storage
  final _auth = FirebaseAuth.instance; // static FirebaseAuth instance
  final _fireStore = FirebaseFirestore.instance; // static FirebaseFirestore
  // instance

  // movieTitle: to store the title of the movie
  // image: path to the image file
  // list: to specify which list
  void addMovie(String movieTitle, File image, String list) async {
    // to create a path for the image to be stored at the Firebase storage
    final ref = FirebaseStorage.instance
        .ref()
        .child('images')
        .child('${_auth.currentUser?.uid}')
        .child('${DateTime.now()}_$list');
    try {
      // upload the image file to the Firebase storage
      await ref.putFile(image);
    } on FirebaseException catch (e) {
      print(e);
    }
    // after uploading the image, _imageURL will store the download link
    _imageURL = await ref.getDownloadURL();

    // after getting the required data in String, finally store the values
    // in Cloud FireStore.
    _fireStore.collection('${_auth.currentUser?.uid}_$list').add(
      {
        kTitleString: movieTitle,
        kImgString: _imageURL,
      },
    );
  }
}
