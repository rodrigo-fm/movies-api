import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/modules/movie_api/domain/entities/movie_search_entity.dart';
import 'package:movies_api/modules/movie_api/domain/usecases/search_movies_usecase.dart';

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
        (realInvocation) async => Right(searchResult),
      );

      // act
      final resultado = await usecase.call(keyword);

      // assert
      expect(resultado, Right(searchResult));
      verify(repository.searchMovie(any));
      verifyNoMoreInteractions(repository);
    },
  );

  // retornar erro caso a requisição retorne erro de datasource

  // erro se encontrar uma lista vazia de resultados
}
