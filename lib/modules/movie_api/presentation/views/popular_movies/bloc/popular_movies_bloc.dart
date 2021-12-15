import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../domain/entities/movie_search_entity.dart';

import '../../../../domain/usecases/get_popular_movies_usecase.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMoviesUsecase getPopularMovies;

  PopularMoviesBloc({
    required this.getPopularMovies,
  }) : super(LoadingState()) {
    on<GetPopularMoviesEvent>((event, emit) async {
      emit(LoadingState());
      final resultado = await getPopularMovies.call();

      resultado.fold(
        (error) => emit(FailureState(error.message)),
        (movies) => emit(SuccessState(movies)),
      );
    });
  }
}
