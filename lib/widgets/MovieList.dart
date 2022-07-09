import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/constants.dart';
import 'package:provider/provider.dart';

import '/utilities/movie_data.dart';
import '../widgets/MovieCard.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieData>(
      builder: (context, movieData, child) {
        return SizedBox(
          height: movieData.toWatchCount > 0 ? 180.0 : 0.0,
          child: ListView.builder(
            itemBuilder: (context, index) {
              final movie = movieData.toWatch[index];
              return MovieCard(
                image: movie.image,
                movieTitle: movie.movieTitle,
                onLongPress: () {
                  movieData.removeFromList(movie, kToWatch);
                },
              );
            },
            itemCount: movieData.toWatchCount,
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }
}
