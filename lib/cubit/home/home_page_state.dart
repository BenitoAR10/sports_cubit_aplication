import 'package:equatable/equatable.dart';
import 'package:sports_cubit_aplication/dto/rol_info_dto.dart';
import '../../dto/account_info_dto.dart';
import '../../status/page_status.dart';

class HomePageState extends Equatable {
  // Necesitamos informar al widget en que estado nos encontramos
  final PageStatus status;
  // Necesitamos enviar los datos que recibimos de service
  final AccountInfoDto? accountInfoDto;
  // Necesitamos el rol del usuario
  final RolInfoDto? rolInfoDto;
  // Error message
  final String? errorMessage;

  const HomePageState({
    this.status = PageStatus.initial,
    this.accountInfoDto,
    this.rolInfoDto,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        accountInfoDto,
        rolInfoDto,
        errorMessage,
      ];

  HomePageState copyWith({
    PageStatus? status,
    AccountInfoDto? accountInfoDto,
    RolInfoDto? rolInfoDto,
    String? errorMessage,
  }) {
    return HomePageState(
      status: status ?? this.status,
      accountInfoDto: accountInfoDto ?? this.accountInfoDto,
      rolInfoDto: rolInfoDto ?? this.rolInfoDto,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
