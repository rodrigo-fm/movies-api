import 'package:dartz/dartz.dart';

import '../../../../shared/errors/failures_error.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/entities/movie_search_entity.dart';
import '../../domain/repositories/movies_repository_interface.dart';
import '../datasources/movies_remote_datasource.dart';

class MoviesRepository implements IMoviesRepository {
  final IMoviesRemoteDatasource datasource;

  MoviesRepository(this.datasource);

  @override
  Future<Either<FailureError, MovieDetailsEntity>> getMovieDetails(
    int idMovie,
  ) async {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<FailureError, List<MovieSearchEntity>>>
      getPopularMovies() async {
    try {
      final filmes = await datasource.getPopularMovies();
      return Right(filmes);
    } catch (e) {
      return Left(ServerFailureError('erro de servidor'));
    }
  }

  @override
  Future<Either<FailureError, List<MovieSearchEntity>>> searchMovie(
    String keyword,
  ) async {
    // TODO: implement searchMovie
    throw UnimplementedError();
  }
}
