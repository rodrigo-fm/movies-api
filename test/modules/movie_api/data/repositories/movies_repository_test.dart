import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:prova_avonale/modules/movie_api/data/datasources/movies_remote_datasource.dart';
import 'package:prova_avonale/modules/movie_api/data/models/movie_details_model.dart';
import 'package:prova_avonale/modules/movie_api/data/models/movie_search_model.dart';
import 'package:prova_avonale/modules/movie_api/data/repositories/movies_repository.dart';
import 'package:prova_avonale/shared/errors/exceptions_error.dart';
import 'package:prova_avonale/shared/errors/failures_error.dart';

import 'movies_repository_test.mocks.dart';

@GenerateMocks([IMoviesRemoteDatasource])
void main() {
  final datasource = MockIMoviesRemoteDatasource();
  final repository = MoviesRepository(datasource);
  final filmes = [
    MovieSearchModel(
      id: 1,
      originalTitle: 'titulo 1',
      voteAverage: 1.0,
    ),
    MovieSearchModel(
      id: 2,
      originalTitle: 'titulo 2',
      voteAverage: 2.0,
    ),
  ];

  group('getPopularMovies', () {
    test(
      'deve retornar uma lista de MovieSearchEntity',
      () async {
        // arrange
        when(datasource.getPopularMovies()).thenAnswer(
          (_) async => filmes,
        );

        // act
        final resultado = await repository.getPopularMovies();

        // asert
        expect(resultado, equals(Right(filmes)));
        verify(datasource.getPopularMovies());
      },
    );
    test(
      'deve retornar um ServerFailureError',
      () async {
        // arrange
        when(datasource.getPopularMovies()).thenThrow(
          ServerException('server exception'),
        );

        // act
        final resultado = await repository.getPopularMovies();

        // assert
        expect(
          resultado,
          equals(Left(ServerFailureError('server failure error'))),
        );
        verify(datasource.getPopularMovies());
      },
    );
  });

  group('searchMovie', () {
    const searchText = 'filme qualquer';
    test(
      'deve retornar uma lista de MovieSearchEntity',
      () async {
        // arrange
        when(datasource.searchMovies(any)).thenAnswer(
          (_) async => filmes,
        );

        // act
        final resultado = await repository.searchMovie(searchText);

        // asert
        expect(resultado, equals(Right(filmes)));
        verify(datasource.searchMovies(any));
      },
    );
    test(
      'deve retornar um ServerFailureError',
      () async {
        // arrange
        when(datasource.searchMovies(any)).thenThrow(
          ServerException('server exception'),
        );

        // act
        final resultado = await repository.searchMovie(searchText);

        // assert
        expect(
          resultado,
          equals(Left(ServerFailureError('server failure error'))),
        );
        verify(datasource.searchMovies(any));
      },
    );
  });

  group('getMovieDetails', () {
    const movieID = 1;
    final movieDetails = MovieDetailsModel(
      id: movieID,
      originalTitle: 'Título 1',
      overview: 'Overview 1',
      popularity: 6.0,
      voteAverage: 8.0,
    );
    test(
      'deve retornar um MovieDetailsEntity',
      () async {
        // arrange
        when(datasource.getMovieDetails(any)).thenAnswer(
          (_) async => movieDetails,
        );

        // act
        final resultado = await repository.getMovieDetails(movieID);

        // asert
        expect(resultado, equals(Right(movieDetails)));
        verify(datasource.getMovieDetails(movieID));
      },
    );
    test(
      'deve retornar um ServerFailureError',
      () async {
        // arrange
        when(datasource.getMovieDetails(any)).thenThrow(
          ServerException('server exception'),
        );

        // act
        final resultado = await repository.getMovieDetails(movieID);

        // assert
        expect(
          resultado,
          equals(Left(ServerFailureError('server failure error'))),
        );
        verify(datasource.getMovieDetails(movieID));
      },
    );
  });
}
