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

  void addMovie(String movieTitle, FileImage image, String list) {
    if (list == kToWatch) {
      toWatch.add(
        Movie(
          movieTitle: movieTitle,
          image: image,
        ),
      );
    } else if (list == kWatched) {
      watched.add(
        Movie(movieTitle: movieTitle, image: image),
      );
    } else if (list == kFavorite) {
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
