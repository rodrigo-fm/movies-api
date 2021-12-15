import 'package:equatable/equatable.dart';

abstract class FailureError extends Equatable {
  final String message;

  const FailureError(this.message);
}

/// Mensagem de erro para erro de comunicação remota
///
/// Ex: via APIs
class ServerFailureError extends FailureError {
  final String message;

  const ServerFailureError(this.message) : super(message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

/// Mensagem de erro para erro de comunicação local
///
/// Ex: Armazenamento local no dispositivo do usuário
class CacheFailureError extends FailureError {
  final String message;

  const CacheFailureError(this.message) : super(message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
