import 'package:flutter/material.dart';

import '../constants.dart';

/*
* MovieCard is a StatelessWidget.
* It has two required parameter: image and movieTitle and one optional
* parameter: onLongPress.
*     image: Required. Accepts a String value that specifies the path of an
*            image.
*     movieTitle: Required. Accepts a String value that specifies the title of
*                 the movie.
*     onLongPress: Optional. Accepts a callback.
*/
class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    required this.image,
    this.onLongPress,
    required this.movieTitle,
  }) : super(key: key);

  final String image;
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
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 5.0,
                    offset: Offset(0.0, 0.75),
                  )
                ],
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                image,
                fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    // To show progress while loading an image
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                      color: kPlatinum,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) =>
                    const Text('Some error occurs'),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              // If the length of the movie is more than 14 characters, it will
              // be displayed as first 11 characters + three dots.
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
