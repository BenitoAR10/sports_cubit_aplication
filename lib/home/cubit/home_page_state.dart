import 'package:equatable/equatable.dart';
import '../../dto/account_info_dto.dart';
import '../../status/page_status.dart';

class HomePageState extends Equatable{
  // Necesitamos informar al widget en que estado nos encontramos
  final PageStatus status;
  // Necesitamos enviar los datos que recibimos de service 
  final AccountInfoDto? accountInfoDto;
  // Error message
  final String? errorMessage;

  const HomePageState({
    this.status = PageStatus.initial,
    this.accountInfoDto,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        accountInfoDto,
        errorMessage,
      ];
  
  HomePageState copyWith({
    PageStatus? status,
    AccountInfoDto? accountInfoDto,
    String? errorMessage,
  }) {
    return HomePageState(
      status: status ?? this.status,
      accountInfoDto: accountInfoDto ?? this.accountInfoDto,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
