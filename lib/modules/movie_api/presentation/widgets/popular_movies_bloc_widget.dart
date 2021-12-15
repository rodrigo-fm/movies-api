import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../views/popular_movies/bloc/popular_movies_bloc.dart';
import 'exibir_lista_filmes_widget.dart';
import 'mensagem_erro_widget.dart';

class PopularMoviesBlocWidget extends StatefulWidget {
  const PopularMoviesBlocWidget({Key? key}) : super(key: key);

  @override
  State<PopularMoviesBlocWidget> createState() =>
      _PopularMoviesBlocWidgetState();
}

class _PopularMoviesBlocWidgetState extends State<PopularMoviesBlocWidget> {
  void dispatchPopularMovies() {
    BlocProvider.of<PopularMoviesBloc>(context).add(
      GetPopularMoviesEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    dispatchPopularMovies();
    return Column(
      children: [
        BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
          builder: (ctx, state) {
            switch (state.runtimeType) {
              case SuccessState:
                final sucesso = (state as SuccessState);
                return ExibirListaFilmesWidget(sucesso.movies);
              case FailureState:
                final falha = (state as FailureState);
                return MensagemErroWidget(falha.message);
            }
            // LoadingState
            return const CircularProgressIndicator();
          },
        ),
      ],
    );
  }
}
