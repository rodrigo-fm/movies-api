part of 'popular_movies_bloc.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

class LoadingState extends PopularMoviesState {}

class SuccessState extends PopularMoviesState {
  final List<MovieSearchEntity> movies;

  const SuccessState(this.movies);
}

class FailureState extends PopularMoviesState {
  final String message;

  const FailureState(this.message);
}
