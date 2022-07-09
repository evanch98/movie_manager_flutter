import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/utilities/movie_data.dart';
import 'package:movie_manager_flutter/widgets/MovieCard.dart';
import 'package:provider/provider.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieData>(
      builder: (context, movieData, child) {
        return SizedBox(
          width: 200,
          height: 180,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return MovieCard(
                image: movieData.toWatch[index].image,
                movieTitle: movieData.toWatch[index].movieTitle,
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
