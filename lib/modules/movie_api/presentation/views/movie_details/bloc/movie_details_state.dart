part of 'movie_details_bloc.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

class LoadingState extends MovieDetailsState {}

class SuccessState extends MovieDetailsState {
  final MovieDetailsEntity movie;

  const SuccessState(this.movie);
}

class FailureState extends MovieDetailsState {
  final String message;

  const FailureState(this.message);
}
