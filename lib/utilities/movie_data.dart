import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/widgets/MovieCard.dart';

class MovieData extends ChangeNotifier {
  List<MovieCard> toWatch = [
    const MovieCard(movieTitle: 'The Lodge'),
  ];

  void addToWatch(String movieTitle, Image image) {
    toWatch.add(
      MovieCard(
        movieTitle: movieTitle,
        image: image,
      ),
    );
    notifyListeners();
  }
}
