import 'package:flutter_test/flutter_test.dart';
import 'package:movies_api/modules/movie_api/data/models/movie_search_model.dart';
import 'package:movies_api/modules/movie_api/domain/entities/movie_search_entity.dart';

import '../../../../files/get_file.dart';

void main() {
  final model = MovieSearchModel(
    id: 1,
    originalTitle: 'Título original',
    voteAverage: 6.8,
    posterPath: '/path-2',
  );
  test(
    'deve demonstrar que um MovieSearchModel também é um MovieSearchEntity',
    () {
      // assert
      expect(model, isA<MovieSearchEntity>());
    },
  );

  group('fromJsonList', () {
    test(
      'deve retornar uma lista de MovieSearchModel a partir de um json',
      () {
        // arrange
        final jsonTest = getFile('popular_movies.json');

        // act
        final resultado = MovieSearchModel.fromJsonList(jsonTest);

        // assert
        expect(resultado, isA<List<MovieSearchModel>>());
      },
    );
  });
}
