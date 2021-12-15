import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/movie_details_bloc.dart';
import 'exibir_movie_details_widget.dart';

class MovieDetailsBlocWidget extends StatefulWidget {
  final int movieID;
  const MovieDetailsBlocWidget(this.movieID, {Key? key}) : super(key: key);

  @override
  State<MovieDetailsBlocWidget> createState() => _MovieDetailsBlocWidgetState();
}

class _MovieDetailsBlocWidgetState extends State<MovieDetailsBlocWidget> {
  void dispatchMovieDetails() {
    BlocProvider.of<MovieDetailsBloc>(context).add(
      GetMovieDetailsEvent(widget.movieID),
    );
  }

  @override
  Widget build(BuildContext context) {
    dispatchMovieDetails();
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (ctx, state) {
        switch (state.runtimeType) {
          case SuccessState:
            final filme = (state as SuccessState).movie;
            return ExibirMovieDetailsWidget(filme);
          case FailureState:
            final mensagem = (state as FailureState).message;
            return Center(
              child: Text(mensagem),
            );
        }
        // LoadingState
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
