import 'package:flutter_test/flutter_test.dart';
import 'package:movies_api/modules/movie_api/data/models/movie_details_model.dart';
import 'package:movies_api/modules/movie_api/domain/entities/movie_details_entity.dart';

import '../../../../files/get_file.dart';

void main() {
  final model = MovieDetailsModel(
    id: 1,
    originalTitle: 'titulo qualquer',
    overview: 'Overview do filme qualquer detalhe aqui bla bla',
    popularity: 8.0,
    voteAverage: 5.7,
  );
  test(
    'deve demonstrar que um MovieDetailsModel também é um MovieDetailsEntity',
    () {
      // assert
      expect(model, isA<MovieDetailsEntity>());
    },
  );

  group('fromJson', () {
    test(
      'deve retornar um MovieDetailsModel a partir de um json',
      () {
        // arrange
        final jsonTest = getFile('movie_detail.json');

        // act
        final resultado = MovieDetailsModel.fromJson(jsonTest);

        // assert
        expect(resultado, isA<MovieDetailsModel>());
      },
    );
  });
}
