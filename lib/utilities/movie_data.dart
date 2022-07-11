import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '/utilities/movie.dart';
import '../constants.dart';

/* The MovieData class has three lists. They are toWatch movie list, watched
 * movie list, and favorite movie list.
 * The method addMovie accepts three parameters movieTitle, image, and list.
 *     movieTitle: String value, and for the name of the movie.
 *     image: FileImage value, and for the image of the movie.
 *     list: String value, and to identify which list the movie should be added.
 *     The movieTitle and image is stored in the movie and added to the
 *     appropriate list specified by list parameter.
 * There are three getter methods in this class.
 *     toWatchCount: To get the length of the toWatch list.
 *     watchedCount: To get the length of the watched list.
 *     favoriteCount: To get the length of the favorite list.
 * The method removeFromList accepts two parameters movie and list.
 *     movie: Movie value, and to identify the movie object to be removed.
 *     list: String value, and to specify which list.
*/
class MovieData extends ChangeNotifier {
  List<Movie> toWatch = [];
  List<Movie> watched = [];
  List<Movie> favorite = [];

  String? _imageURL;
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  void addMovie(String movieTitle, File image, String list) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('images')
        .child('${_auth.currentUser?.uid}')
        .child('${DateTime.now()}_${image}_$list');
    try {
      await ref.putFile(image);
    } on FirebaseException catch (e) {
      print(e);
    }
    _imageURL = await ref.getDownloadURL();

    _fireStore.collection('${_auth.currentUser?.uid}_$list').add({
      'title': movieTitle,
      'image': _imageURL,
    });
  }

  int get toWatchCount {
    return toWatch.length;
  }

  int get watchedCount {
    return watched.length;
  }

  int get favoriteCount {
    return favorite.length;
  }

  void removeFromList(Movie movie, String list) {
    if (list == kToWatch) {
      toWatch.remove(movie);
    } else if (list == kWatched) {
      watched.remove(movie);
    } else if (list == kFavorite) {
      favorite.remove(movie);
    }
    notifyListeners();
  }
}
