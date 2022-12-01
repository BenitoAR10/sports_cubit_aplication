part of 'LcAddPlanescubit.dart';

class AddPlanState extends Equatable {
  final PageStatus status;
  final String? result;
  final String? errorMessage;
  final Exception? exception;

  const AddPlanState({
    this.status = PageStatus.initial,
    this.result,
    this.errorMessage,
    this.exception,
  });

  AddPlanState copyWith({
    PageStatus? status,
    String? result,
    String? errorMessage,
    Exception? exception,
  }) {
    return AddPlanState(
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
