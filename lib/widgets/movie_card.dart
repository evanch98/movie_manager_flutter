import 'package:flutter/material.dart';

import '../constants.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    required this.image,
    this.onLongPress,
    required this.movieTitle,
  }) : super(key: key);

  final NetworkImage image;
  final String movieTitle;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: Container(
        margin: const EdgeInsets.only(left: 10.0),
        child: Column(
          children: [
            Container(
              height: 150.0,
              width: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: kRodeoDust,
              ),
              clipBehavior: Clip.hardEdge,
              child: Image(
                image: image,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              movieTitle.length > 14
                  ? '${movieTitle.substring(0, 11)}...'
                  : movieTitle,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
            ),
          ],
        ),
      ),
    );
  }
}
