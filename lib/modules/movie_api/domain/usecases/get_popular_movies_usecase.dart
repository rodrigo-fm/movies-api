import 'package:dartz/dartz.dart';
import 'package:prova_avonale/modules/movie_api/domain/repositories/movies_repository_interface.dart';

import '../../../../shared/errors/failures_error.dart';
import '../entities/movie_search_entity.dart';

class GetPopularMoviesUsecase {
  final IMoviesRepository repository;

  GetPopularMoviesUsecase(this.repository);

  Future<Either<FailureError, List<MovieSearchEntity>>> call() async {
    return await repository.getPopularMovies();
  }
}
