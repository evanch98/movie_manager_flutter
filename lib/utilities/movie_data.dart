import 'package:flutter/material.dart';

import '/utilities/movie.dart';

class MovieData extends ChangeNotifier {
  List<Movie> toWatch = [];
  List<Movie> watched = [];
  List<Movie> favorite = [];

  void addMovie(String movieTitle, FileImage image, String list) {
    if (list == 'to watch') {
      toWatch.add(
        Movie(
          movieTitle: movieTitle,
          image: image,
        ),
      );
    } else if (list == 'watched') {
      watched.add(
        Movie(movieTitle: movieTitle, image: image),
      );
      notifyListeners();
    } else if (list == 'favorite') {
      favorite.add(
        Movie(movieTitle: movieTitle, image: image),
      );
    }
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

  void removeFromList(Movie movie, String list) {
    if (list == 'to watch') {
      toWatch.remove(movie);
    } else if (list == 'watched') {
      watched.remove(movie);
    } else if (list == 'favorite') {
      favorite.remove(movie);
    }
    notifyListeners();
  }
}
