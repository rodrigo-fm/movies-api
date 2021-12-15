import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:prova_avonale/modules/movie_api/domain/entities/movie_details_entity.dart';
import 'package:prova_avonale/modules/movie_api/domain/repositories/movies_repository_interface.dart';
import 'package:prova_avonale/modules/movie_api/domain/usecases/get_movie_details_usecase.dart';
import 'package:prova_avonale/shared/errors/failures_error.dart';

import 'get_popular_movies_usecase_test.mocks.dart';

@GenerateMocks([IMoviesRepository])
void main() {
  final repository = MockIMoviesRepository();
  final usecase = GetMovieDetailsUsecase(repository);

  group('call', () {
    const idMovie = 1;
    final filme = MovieDetailsEntity(
      id: idMovie,
      originalTitle: 'Título do filme',
      overview: 'Resumo do filme 1 aqui',
      popularity: 8.0,
      voteAverage: 5.4,
    );
    test('deve retornar MovieDetailsEntity', () async {
      // arrange
      when(repository.getMovieDetails(any)).thenAnswer(
        (_) async => Right(filme),
      );

      // act
      final resultado = await usecase.call(idMovie);

      // assert
      expect(resultado, Right(filme));
      verify(repository.getMovieDetails(idMovie));
      verifyNoMoreInteractions(repository);
    });

    test('deve retornar um FailureError', () async {
      // arrange
      when(repository.getMovieDetails(any)).thenAnswer(
        (_) async => Left(ServerFailureError('erro de servidor')),
      );

      // act
      final resultado = await usecase.call(idMovie);

      // assert
      expect(resultado, Left(ServerFailureError('erro de servidor')));
      verify(repository.getMovieDetails(idMovie));
      verifyNoMoreInteractions(repository);
    });
  });
}
