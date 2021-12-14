import 'package:equatable/equatable.dart';

abstract class FailureError extends Equatable {}

/// Mensagem de erro para erro de comunicação remota
///
/// Ex: via APIs
class ServerFailureError extends FailureError {
  final String mensagem;

  ServerFailureError(this.mensagem);

  @override
  // TODO: implement props
  List<Object?> get props => [mensagem];
}

/// Mensagem de erro para erro de comunicação local
///
/// Ex: Armazenamento local no dispositivo do usuário
class CacheFailureError extends FailureError {
  final String mensagem;

  CacheFailureError(this.mensagem);

  @override
  // TODO: implement props
  List<Object?> get props => [mensagem];
}
