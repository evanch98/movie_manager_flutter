import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/constants.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    this.image,
    required this.movieTitle,
  }) : super(key: key);

  final Image? image;
  final String movieTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200.0,
          width: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: kRodeoDust,
          ),
          child: Center(
            child: image ?? const Text('No Image'),
          ),
        ),
        Text(
          movieTitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
