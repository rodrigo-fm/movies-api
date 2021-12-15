import 'package:flutter/material.dart';
import '../../domain/entities/movie_search_entity.dart';

class ExibirBuscaFilmeWidget extends StatelessWidget {
  final MovieSearchEntity movie;
  const ExibirBuscaFilmeWidget(
    this.movie, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navegar para a página de detalhes do filme
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2.5,
        width: (MediaQuery.of(context).size.width / 2.2) - 7.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.network(movie.posterPath),
            Image.network(
              'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-21a1c803fe4ff4b858de24f5c91ec57f_screen.jpg',
            ),
            Text(movie.originalTitle),
            Text('Média: ${movie.voteAverage}'),
          ],
        ),
      ),
    );
  }
}
