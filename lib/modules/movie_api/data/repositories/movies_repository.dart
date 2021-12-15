import 'package:dartz/dartz.dart';
import '../models/movie_search_model.dart';

import '../../../../shared/errors/failures_error.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/entities/movie_search_entity.dart';
import '../../domain/repositories/movies_repository_interface.dart';
import '../datasources/movies_remote_datasource.dart';

typedef Future<List<MovieSearchModel>> _SearchChooser();

class MoviesRepository implements IMoviesRepository {
  final IMoviesRemoteDatasource datasource;

  MoviesRepository(this.datasource);

  @override
  Future<Either<FailureError, MovieDetailsEntity>> getMovieDetails(
    int idMovie,
  ) async {
    try {
      final filme = await datasource.getMovieDetails(idMovie);
      return Right(filme);
    } catch (e) {
      return Left(ServerFailureError('server failure error'));
    }
  }

  @override
  Future<Either<FailureError, List<MovieSearchEntity>>>
      getPopularMovies() async {
    return _getMovies(() {
      return datasource.getPopularMovies();
    });
  }

  @override
  Future<Either<FailureError, List<MovieSearchEntity>>> searchMovie(
    String keyword,
  ) async {
    return _getMovies(() {
      return datasource.searchMovies(keyword);
    });
  }

  Future<Either<FailureError, List<MovieSearchEntity>>> _getMovies(
    _SearchChooser getMovie,
  ) async {
    try {
      final filmes = await getMovie();
      return Right(filmes);
    } catch (e) {
      return Left(ServerFailureError('server failure error'));
    }
  }
}
