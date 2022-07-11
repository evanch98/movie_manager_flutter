// Importing required packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_manager_flutter/constants.dart';

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
class MovieList extends StatefulWidget {
  const MovieList({
    Key? key,
    required this.list,
  }) : super(key: key);

  final String list;

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<QuerySnapshot>(
          stream: _fireStore
              .collection('${_auth.currentUser?.uid}_${widget.list}')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final movies = snapshot.data!.docs;
              List<MovieCard> movieCards = [];
              for (var movie in movies) {
                final title = movie[kTitleString];
                final image = NetworkImage(movie[kImgString]);

                final movieCard = MovieCard(
                  image: image,
                  movieTitle: title,
                  onLongPress: () async {
                    _fireStore
                        .collection('${_auth.currentUser?.uid}_${widget.list}')
                        .doc(movie.id)
                        .delete();
                  },
                );
                movieCards.add(movieCard);
              }
              return SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: movieCards,
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
