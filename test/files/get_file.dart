import 'dart:io';

String getFile(String nomeArquivo) {
  return File('test/files/$nomeArquivo').readAsStringSync();
}
