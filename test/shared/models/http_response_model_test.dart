import 'package:flutter_test/flutter_test.dart';
import 'package:prova_avonale/shared/entities/http_response_entity.dart';
import 'package:prova_avonale/shared/models/http_response_model.dart';

import '../../files/get_file.dart';

void main() {
  final model = HttpResponseModel('Mensagem de erro');
  test(
    'deve demonstrar que um HttpResponseModel também é um HttpResponseEntity',
    () {
      // assert
      expect(model, isA<HttpResponseEntity>());
    },
  );
  group('fromJson', () {
    test(
      'deve retornar um HttpResponseModel a partir de um json',
      () {
        // arrange
        final jsonTeste = getFile('failed_request.json');

        // act
        final resultado = HttpResponseModel.fromJson(jsonTeste);

        // assert
        expect(resultado, isA<HttpResponseModel>());
      },
    );
  });
}
