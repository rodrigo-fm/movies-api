import 'package:dartz/dartz.dart';

import '../../../../shared/errors/failures_error.dart';
import '../entities/movie_details_entity.dart';
import '../entities/movie_search_entity.dart';

abstract class IMoviesRepository {
  Future<Either<FailureError, List<MovieSearchEntity>>> getPopularMovies();
  Future<Either<FailureError, List<MovieSearchEntity>>> searchMovie(
    String keyword,
  );
  Future<Either<FailureError, MovieDetailsEntity>> getMovieDetails(
    int idMovie,
  );
}
