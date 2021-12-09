import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int status;

  const Failure(this.message, this.status);
  @override
  List<Object?> get props => [message, status];
}

class FailureResponse extends Failure {
  const FailureResponse(String message, int status) : super(message, status);
  @override
  List<Object?> get props => [message, status];
}

class FailureLocalStorage extends Failure {
  const FailureLocalStorage(String message, int status)
      : super(message, status);
  @override
  List<Object?> get props => [message, status];
}
