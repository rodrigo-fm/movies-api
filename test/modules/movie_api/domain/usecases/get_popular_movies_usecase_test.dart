import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/modules/movie_api/domain/entities/movie_search_entity.dart';
import 'package:movies_api/modules/movie_api/domain/repositories/movies_repository_interface.dart';
import 'package:movies_api/modules/movie_api/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_api/shared/errors/failures_error.dart';

import 'get_popular_movies_usecase_test.mocks.dart';

@GenerateMocks([IMoviesRepository])
void main() {
  final repository = MockIMoviesRepository();
  final usecase = GetPopularMoviesUsecase(repository);

  final filmes = [
    MovieSearchEntity(
      id: 1,
      originalTitle: 'título 1',
      voteAverage: 7.8,
      posterPath: '/path',
    ),
    MovieSearchEntity(
      id: 2,
      originalTitle: 'título 2',
      voteAverage: 6.4,
      posterPath: '/path-2',
    ),
  ];

  test(
    'deve retornar os filmes mais populares',
    () async {
      // arrange
      when(repository.getPopularMovies()).thenAnswer(
        (_) async => Right(filmes),
      );

      // act
      final resultado = await usecase.call();

      // assert
      expect(resultado, Right(filmes));
      verify(repository.getPopularMovies());
      verifyNoMoreInteractions(repository);
    },
  );

  test(
    'deve retornar uma mensagem de erro após falha no resgate dos filmes populares',
    () async {
      // arrange
      when(repository.getPopularMovies()).thenAnswer(
        (_) async => Left(ServerFailureError('erro de servidor')),
      );

      // act
      final resultado = await usecase.call();

      // assert
      expect(resultado, Left(ServerFailureError('erro de servidor')));
      verify(repository.getPopularMovies());
      verifyNoMoreInteractions(repository);
    },
  );
}
