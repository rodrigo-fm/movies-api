import 'package:dartz/dartz.dart';

import '../../../../shared/errors/failures_error.dart';
import '../entities/movie_search_entity.dart';
import '../repositories/movies_repository_interface.dart';

class SearchMoviesUsecase {
  final IMoviesRepository repository;

  SearchMoviesUsecase(this.repository);

  Future<Either<FailureError, List<MovieSearchEntity>>> call(
    String keyword,
  ) async {
    throw UnimplementedError();
  }
}
