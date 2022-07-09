import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/utilities/movie.dart';

class MovieData extends ChangeNotifier {
  List<Movie> toWatch = [];

  void addToWatch(String movieTitle, FileImage image) {
    toWatch.add(
      Movie(
        movieTitle: movieTitle,
        image: image,
      ),
    );
    notifyListeners();
  }

  int get toWatchCount {
    return toWatch.length;
  }
}
