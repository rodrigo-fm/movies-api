/// Exception de servidor (comunicação com APIs e etc)
class ServerException implements Exception {
  final String mensagem;

  ServerException(this.mensagem);
}

/// Exception de cache (armazenamento local)
class CacheException implements Exception {
  final String mensagem;

  CacheException(this.mensagem);
}
