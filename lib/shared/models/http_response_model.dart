import 'dart:convert';

import '../entities/http_response_entity.dart';

class HttpResponseModel extends HttpResponseEntity {
  final String mensagem;

  HttpResponseModel(this.mensagem) : super(mensagem);

  factory HttpResponseModel.fromMap(Map<String, dynamic> map) {
    return HttpResponseModel(
      map['status_message'] ?? 'Erro desconhecido',
    );
  }

  // TODO: testar esse método
  factory HttpResponseModel.fromJson(String source) =>
      HttpResponseModel.fromMap(json.decode(source));
}
