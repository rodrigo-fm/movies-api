import 'package:http/http.dart' as http;
import '../../../../shared/errors/exceptions_error.dart';
import '../../../../shared/models/http_response_model.dart';

import '../../../../api_key.dart';
import '../models/movie_details_model.dart';
import '../models/movie_search_model.dart';

abstract class IMoviesRemoteDatasource {
  Future<List<MovieSearchModel>> getPopularMovies();
  Future<List<MovieSearchModel>> searchMovies(String keyword);
  Future<MovieDetailsModel> getMovieDetails(int id);
}

class MoviesRemoteDatasource implements IMoviesRemoteDatasource {
  final apiURL = 'https://api.themoviedb.org/3';
  final http.Client client;

  MoviesRemoteDatasource(this.client);

  @override
  Future<MovieDetailsModel> getMovieDetails(int id) async {
    final response = await client.get(
      Uri.parse('$apiURL/movie/$id?api_key=$apiKey&language=en-US'),
    );

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.body);
    }

    throw ServerException(
      HttpResponseModel.fromJson(response.body).mensagem,
    );
  }

  @override
  Future<List<MovieSearchModel>> getPopularMovies() async {
    return _getMovies(
      '$apiURL/movie/popular?api_key=$apiKey&language=en-US&page=1',
    );
  }

  @override
  Future<List<MovieSearchModel>> searchMovies(String keyword) {
    return _getMovies(
      '$apiURL/search/movie?api_key=$apiKey'
      '&language=en-US&query=$keyword&page=1&include_adult=true',
    );
  }

  Future<List<MovieSearchModel>> _getMovies(String url) async {
    final response = await client.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      return MovieSearchModel.fromJsonList(response.body);
    }
    throw ServerException(
      HttpResponseModel.fromJson(response.body).mensagem,
    );
  }
}
