import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:prova_avonale/api_key.dart';
import 'package:prova_avonale/modules/movie_api/data/datasources/movies_remote_datasource.dart';
import 'package:prova_avonale/modules/movie_api/data/models/movie_details_model.dart';
import 'package:prova_avonale/modules/movie_api/data/models/movie_search_model.dart';
import 'package:prova_avonale/shared/errors/exceptions_error.dart';

import '../../../../files/get_file.dart';
import 'movies_remote_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  final mockClient = MockClient();
  final datasource = MoviesRemoteDatasource(mockClient);

  void setUpHTTPRequest(
    String nomeArquivo, {
    required bool sucesso,
  }) {
    final response = getFile(sucesso ? nomeArquivo : 'failed_request.json');
    when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (realInvocation) async => http.Response(
        response,
        sucesso ? 200 : 404,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        },
      ),
    );
  }

  void verificarRequisicao(String url) {
    verify(mockClient.get(Uri.parse(url)));
  }

  group('getPopularMovies', () {
    test(
      'deve retornar uma lista de MovieSearchModel ao realizar uma requisição GET',
      () async {
        // arrange
        setUpHTTPRequest('popular_movies.json', sucesso: true);

        // act
        final resultado = await datasource.getPopularMovies();

        // asert
        expect(resultado, isA<List<MovieSearchModel>>());
        verificarRequisicao(
          '${datasource.apiURL}/movie/popular?api_key=$apiKey&language=en-US&page=1',
        );
      },
    );

    test(
      'deve retornar uma mensagem de erro ao realizar uma requisição GET',
      () async {
        // arrange
        setUpHTTPRequest('', sucesso: false);

        // act
        final call = datasource.getPopularMovies;

        // asert
        expect(
          () => call(),
          throwsA(const TypeMatcher<ServerException>()),
        );
        verificarRequisicao(
          '${datasource.apiURL}/movie/popular?api_key=$apiKey&language=en-US&page=1',
        );
      },
    );
  });

  group('searchMovies', () {
    const keyword = 'filme qualquer';
    test(
      'deve retornar uma lista de MovieSearchModel ao realizar uma requisição GET',
      () async {
        // arrange
        setUpHTTPRequest('popular_movies.json', sucesso: true);

        // act
        final resultado = await datasource.searchMovies(keyword);

        // asert
        expect(resultado, isA<List<MovieSearchModel>>());
        verificarRequisicao(
          '${datasource.apiURL}/search/movie?api_key=$apiKey&language=en-US&query=$keyword&page=1&include_adult=false',
        );
      },
    );

    test(
      'deve retornar uma mensagem de erro ao realizar uma requisição GET',
      () async {
        // arrange
        setUpHTTPRequest('', sucesso: false);

        // act
        final call = datasource.searchMovies;

        // asert
        expect(
          () => call(keyword),
          throwsA(const TypeMatcher<ServerException>()),
        );
        verificarRequisicao(
          '${datasource.apiURL}/search/movie?api_key=$apiKey&language=en-US&query=$keyword&page=1&include_adult=false',
        );
      },
    );
  });

  group('getMovieDetails', () {
    const movieID = 1;
    test(
      'deve retornar uma MovieDetailsModel ao realizar uma requisição GET',
      () async {
        // arrange
        setUpHTTPRequest('movie_detail.json', sucesso: true);

        // act
        final resultado = await datasource.getMovieDetails(movieID);

        // asert
        expect(resultado, isA<MovieDetailsModel>());
        verificarRequisicao(
          '${datasource.apiURL}/movie/$movieID?api_key=$apiKey&language=en-US',
        );
      },
    );

    test(
      'deve retornar uma mensagem de erro ao realizar uma requisição GET',
      () async {
        // arrange
        setUpHTTPRequest('', sucesso: false);

        // act
        final call = datasource.getMovieDetails;

        // asert
        expect(
          () => call(movieID),
          throwsA(const TypeMatcher<ServerException>()),
        );
        verificarRequisicao(
          '${datasource.apiURL}/movie/$movieID?api_key=$apiKey&language=en-US',
        );
      },
    );
  });
}
