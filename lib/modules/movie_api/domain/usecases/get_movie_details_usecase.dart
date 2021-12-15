import 'package:dartz/dartz.dart';

import '../../../../shared/errors/failures_error.dart';
import '../entities/movie_details_entity.dart';
import '../repositories/movies_repository_interface.dart';

class GetMovieDetailsUsecase {
  final IMoviesRepository repository;

  GetMovieDetailsUsecase(this.repository);

  Future<Either<FailureError, MovieDetailsEntity>> call(
    int idMovie,
  ) async {
    return await repository.getMovieDetails(idMovie);
  }
}
