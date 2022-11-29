import 'package:equatable/equatable.dart';

import '../../dto/rol_info_dto.dart';
import '../../status.dart';

class LoginState extends Equatable {
  final PageStatus status;
  final bool loginSuccess;
  final String? errorMessage;
  final Exception? exception;
  final String? token;
  final String? refreshToken;
  final List<String>? grupos;
  final RolInfoDto? rolInfoDto;

  const LoginState({
    this.status = PageStatus.initial,
    this.loginSuccess = false,
    this.errorMessage,
    this.exception,
    this.token,
    this.refreshToken,
    this.grupos,
    this.rolInfoDto,
  });

  LoginState copyWith({
    PageStatus? status,
    bool? loginSuccess,
    String? errorMessage,
    Exception? exception,
    String? token,
    String? refreshToken,
    List<String>? grupos,
    RolInfoDto? rolInfoDto,
  }) {
    return LoginState(
      status: status ?? this.status,
      loginSuccess: loginSuccess ?? this.loginSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
      exception: exception ?? this.exception,
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
      grupos: grupos ?? this.grupos,
      rolInfoDto: rolInfoDto ?? this.rolInfoDto,
    );
  }

  @override
  List<Object?> get props => [
        status,
        loginSuccess,
        errorMessage,
        exception,
        token,
        refreshToken,
        grupos,
        rolInfoDto,
      ];
}
