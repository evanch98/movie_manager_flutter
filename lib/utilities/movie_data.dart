import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/widgets/MovieCard.dart';

class MovieData extends ChangeNotifier {
  List<MovieCard> toWatch = [
    const MovieCard(movieTitle: 'The Lodge'),
    const MovieCard(movieTitle: 'Doctor Strange'),
    const MovieCard(movieTitle: 'Tomorrowland'),
    const MovieCard(movieTitle: 'New York Minute'),
  ];
}
