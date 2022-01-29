import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/exibir_lista_filmes_widget.dart';
import '../../widgets/mensagem_erro_widget.dart';
import 'bloc/popular_movies_bloc.dart';

class PopularMoviesView extends StatefulWidget {
  final PopularMoviesBloc bloc;
  const PopularMoviesView({required this.bloc, Key? key}) : super(key: key);

  @override
  State<PopularMoviesView> createState() => _PopularMoviesViewState();
}

class _PopularMoviesViewState extends State<PopularMoviesView> {
  void _getPopularMovies() {
    widget.bloc.add(GetPopularMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    _getPopularMovies();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmes populares'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => setState(() {}),
            icon: const Icon(Icons.restart_alt),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const Text('Filmes populares'),
          const SizedBox(height: 15),
          BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
            bloc: widget.bloc,
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
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
