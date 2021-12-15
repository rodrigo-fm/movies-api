import 'package:flutter/material.dart';

import '../../../../domain/entities/movie_details_entity.dart';

class ExibirMovieDetailsWidget extends StatelessWidget {
  final MovieDetailsEntity filme;
  const ExibirMovieDetailsWidget(this.filme, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        Image.network(
          'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-21a1c803fe4ff4b858de24f5c91ec57f_screen.jpg',
        ),
        Text(filme.originalTitle),
        Text(filme.overview),
        Text(filme.popularity.toString()),
        Text(filme.voteAverage.toString()),
      ],
    );
  }
}
