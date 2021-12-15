import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/movie_details_entity.dart';
import '../../../../domain/usecases/get_movie_details_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUsecase getMovieDetails;

  MovieDetailsBloc({required this.getMovieDetails}) : super(LoadingState()) {
    on<GetMovieDetailsEvent>((event, emit) async {
      emit(LoadingState());

      final resultado = await getMovieDetails.call(event.movieID);

      resultado.fold(
        (error) => emit(FailureState(error.message)),
        (movie) => emit(SuccessState(movie)),
      );
    });
  }
}
