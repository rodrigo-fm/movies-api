enum UsecaseErrorEnum {
  nenhumFilmeEncontrado,
}

extension UsecaseErrorEnumExtension on UsecaseErrorEnum {
  String get message {
    switch (this) {
      case UsecaseErrorEnum.nenhumFilmeEncontrado:
        return 'Nenhum filme foi encontrado na sua busca';
    }
  }
}
