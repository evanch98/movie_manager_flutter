import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/constants.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    this.image,
    this.onTap,
    this.onLongPress,
    required this.movieTitle,
  }) : super(key: key);

  final Image? image;
  final String movieTitle;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        margin: const EdgeInsets.only(left: 10.0),
        child: Column(
          children: [
            Container(
              height: 150.0,
              width: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: kRodeoDust,
              ),
              child: Center(
                child: image ?? const Text('No Image'),
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
