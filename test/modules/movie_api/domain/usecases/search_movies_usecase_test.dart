import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/modules/movie_api/domain/entities/movie_search_entity.dart';
import 'package:movies_api/modules/movie_api/domain/enums/usecase_error_messages_enum.dart';
import 'package:movies_api/modules/movie_api/domain/usecases/search_movies_usecase.dart';
import 'package:movies_api/shared/errors/failures_error.dart';

import 'get_movie_details_usecase_test.mocks.dart';
import 'search_movies_usecase_test.mocks.dart';

@GenerateMocks([MovieSearchEntity])
void main() {
  final repository = MockIMoviesRepository();

  final usecase = SearchMoviesUsecase(repository);
  final searchResult = [MockMovieSearchEntity(), MockMovieSearchEntity()];
  const keyword = 'Matrix';
  test(
    'Deve retornar uma lista de MovieSearchEntity após uma busca bem sucedida',
    () async {
      // arrange
      when(repository.searchMovie(any)).thenAnswer(
        (_) async => Right(searchResult),
      );

      // act
      final resultado = await usecase.call(keyword);

      // assert
      expect(resultado, Right(searchResult));
      verify(repository.searchMovie(any));
      verifyNoMoreInteractions(repository);
    },
  );

  const serverFailure = ServerFailureError('erro');

  // retornar erro caso a requisição retorne erro de datasource
  test(
    'Deve retornar uma lista de MovieSearchEntity após uma busca bem sucedida',
    () async {
      // arrange
      when(repository.searchMovie(any)).thenAnswer(
        (_) async => const Left(serverFailure),
      );

      // act
      final resultado = await usecase.call(keyword);

      // assert
      expect(resultado, const Left(serverFailure));
      verify(repository.searchMovie(any));
      verifyNoMoreInteractions(repository);
    },
  );

  // erro se encontrar uma lista vazia de resultados
  final genericFailure = GenericFailureError(
    UsecaseErrorEnum.nenhumFilmeEncontrado.message,
  );
  test(
    'Deve retornar uma lista de MovieSearchEntity após uma busca bem sucedida',
    () async {
      // arrange
      when(repository.searchMovie(any)).thenAnswer(
        (_) async => const Right([]),
      );

      // act
      final resultado = await usecase.call(keyword);

      // assert
      expect(resultado, Left(genericFailure));
      verify(repository.searchMovie(any));
      verifyNoMoreInteractions(repository);
    },
  );
}
