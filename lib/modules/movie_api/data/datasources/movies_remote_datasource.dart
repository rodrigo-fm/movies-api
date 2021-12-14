import '../models/movie_details_model.dart';
import '../models/movie_search_model.dart';

abstract class IMoviesRemoteDatasource {
  Future<List<MovieSearchModel>> getPopularMovies();
  Future<List<MovieSearchModel>> searchMovies(String keyword);
  Future<MovieDetailsModel> getMovieDetails(int id);
}

// class MoviesRemoteDatasource implements IMoviesRemoteDatasource {}
