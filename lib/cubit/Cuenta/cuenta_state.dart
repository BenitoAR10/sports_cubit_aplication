import 'package:equatable/equatable.dart';
import 'package:sports_cubit_aplication/dto/account_info_dto.dart';

import '../../status/page_status.dart';

class AcercaCuentaState extends Equatable {
  final PageStatus? status;
  final AccountInfoDto? accountInfoDto;
  final String? errorMessage;

  AcercaCuentaState({
    this.status,
    this.accountInfoDto,
    this.errorMessage,
  });

  AcercaCuentaState copyWith({
    PageStatus? status,
    AccountInfoDto? accountInfoDto,
    String? errorMessage,
  }) {
    return AcercaCuentaState(
      status: status ?? this.status,
      accountInfoDto: accountInfoDto ?? this.accountInfoDto,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        accountInfoDto,
        errorMessage,
      ];
}
