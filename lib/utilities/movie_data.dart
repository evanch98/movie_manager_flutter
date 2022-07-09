import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/widgets/MovieCard.dart';

class MovieData extends ChangeNotifier {
  List<MovieCard> toWatch = [];

  void addToWatch(String movieTitle, FileImage image) {
    toWatch.add(
      MovieCard(
        movieTitle: movieTitle,
        image: image,
      ),
    );
    notifyListeners();
  }

  void removeFromWatch(MovieCard movieCard) {
    toWatch.remove(movieCard);
    notifyListeners();
  }
}
