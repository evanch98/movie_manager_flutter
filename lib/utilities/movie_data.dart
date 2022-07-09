import 'package:flutter/material.dart';

import '/utilities/movie.dart';

class MovieData extends ChangeNotifier {
  List<Movie> toWatch = [];
  List<Movie> watched = [];
  List<Movie> favorite = [];

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

  int get watchedCount {
    return watched.length;
  }

  int get favoriteCount {
    return favorite.length;
  }

  void removeFromToWatch(Movie movie) {
    toWatch.remove(movie);
    notifyListeners();
  }

  void removeFromWatched(Movie movie) {
    watched.remove(movie);
    notifyListeners();
  }

  void removeFromFavorite(Movie movie) {
    favorite.remove(movie);
    notifyListeners();
  }
}
