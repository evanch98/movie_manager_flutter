import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/constants.dart';
import 'package:provider/provider.dart';

import '/utilities/movie_data.dart';
import '../utilities/movie.dart';
import '../widgets/movie_card.dart';

/* MovieList is a StatelessWidget for building a ListView for MovieCard.
 * The widget returns Consumer<MovieData> which in turn returns SizedBox.
 * SizedBox is used to set height for ListView.builder since ListView.builder
 * does not set height.
 * ListView.builder returns list of MovieCards. MovieCards receive their values
 * from MovieData. The state is managed by provider package.
 * The MovieList has one required field.
 *     list: To specify which list.
*/
class MovieList extends StatelessWidget {
  const MovieList({
    Key? key,
    required this.list,
  }) : super(key: key);

  final String list;
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieData>(
      builder: (context, movieData, child) {
        // By default listCount will get the length of toWatch list of
        // MovieData.
        int? listCount;

        // To change the listCount according to the list parameter.
        if (list == kWatched) {
          listCount = movieData.watchedCount;
        } else if (list == kFavorite) {
          listCount = movieData.favoriteCount;
        } else if (list == kToWatch) {
          listCount = movieData.toWatchCount;
        }
        return SizedBox(
          height: listCount! > 0 ? 180.0 : 0.0,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              // By default, movie will get Movie objects from toWatch list.
              late Movie movie;
              // To change the list where movie get Movie objects.
              if (list == kWatched) {
                movie = movieData.watched[index];
              } else if (list == kFavorite) {
                movie = movieData.favorite[index];
              } else if (list == kToWatch) {
                movie = movieData.toWatch[index];
              }
              return MovieCard(
                image: movie.image,
                movieTitle: movie.movieTitle,
                onLongPress: () {
                  movieData.removeFromList(movie, list);
                },
              );
            },
            itemCount: listCount,
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }
}
