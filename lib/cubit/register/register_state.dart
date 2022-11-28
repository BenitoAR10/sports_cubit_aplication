part of 'register_cubit.dart';

class RegisterState extends Equatable{
  final PageStatus status;
  final String? result;
  final String? errorMessage;
  final Exception? exception;

  const RegisterState({
    this.status = PageStatus.initial,
    this.result,
    this.errorMessage,
    this.exception,
  });

  RegisterState copyWith({
    PageStatus? status,
    String? result,
    String? errorMessage,
    Exception? exception,
  }) {
    return RegisterState(
      status: status ?? this.status,
      result: result ?? this.result,
      errorMessage: errorMessage ?? this.errorMessage,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [
        status,
        result,
        errorMessage,
        exception,
      ];
}
