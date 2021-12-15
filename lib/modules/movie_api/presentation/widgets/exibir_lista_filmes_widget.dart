import 'package:flutter/material.dart';
import '../../domain/entities/movie_search_entity.dart';
import 'exibir_busca_filme_widget.dart';

class ExibirListaFilmesWidget extends StatelessWidget {
  final List<MovieSearchEntity> movies;

  const ExibirListaFilmesWidget(
    this.movies, {
    Key? key,
  }) : super(key: key);

  List<Widget> buildList() {
    final List<Widget> resultado = [];
    for (int i = 0; i < movies.length; i += 2) {
      bool addSecondMovie = i + 1 < movies.length;
      resultado.add(Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ExibirBuscaFilmeWidget(movies[i]),
          const SizedBox(width: 15),
          if (addSecondMovie) ExibirBuscaFilmeWidget(movies[i + 1]),
        ],
      ));
    }
    return resultado;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: buildList(),
    );
  }
}
