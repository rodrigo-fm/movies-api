import 'package:equatable/equatable.dart';

abstract class FailureError extends Equatable {
  final String message;

  const FailureError(this.message);
}

/// Mensagem de erro para erro de comunicação remota
///
/// Ex: via APIs
class ServerFailureError extends FailureError {
  const ServerFailureError(String message) : super(message);

  @override
  List<Object?> get props => [message];
}

/// Mensagem de erro para erro de comunicação local
///
/// Ex: Armazenamento local no dispositivo do usuário
class CacheFailureError extends FailureError {
  const CacheFailureError(String message) : super(message);

  @override
  List<Object?> get props => [message];
}

class GenericFailureError extends FailureError {
  const GenericFailureError(String message) : super(message);

  @override
  List<Object?> get props => [message];
}
