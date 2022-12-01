import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sports_cubit_aplication/cubit/LEN_clientes/LenClientesState.dart';
import 'package:sports_cubit_aplication/dto/account_info_dto.dart';
import 'package:sports_cubit_aplication/dto/pagesLugarEntrenador/clientesLugar_dto.dart';
import 'package:sports_cubit_aplication/service/LEN_clientes_service.dart';

import '../../service/account_service.dart';

import '../../status/page_status.dart';

class LENclientesCubit extends Cubit<LENclientesState> {
  LENclientesCubit() : super(LENclientesState());

  void init() async {
    emit(state.copyWith(status: PageStatus.loading));
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: "TOKEN");
    try {
      if (token != null) {
        // Invocamos al servicio
        AccountInfoDto accountInfoDto =
            await AccountService().getAccountInfo(token);

        List<ClientesLenDto> clientesLeDto =
            await LENclientsService().getClientesLEN(accountInfoDto.id!);

        emit(state.copyWith(
          status: PageStatus.success,
          clientesLenDto: clientesLeDto,
        ));
      } else {
        // TODO no hay token debe ir a login
        emit(state.copyWith(
          status: PageStatus.error,
          errorMessage: "Usuario no autenticado",
        ));
      }
    } on Exception catch (e, stacktrace) {
      emit(state.copyWith(
        status: PageStatus.error,
        errorMessage: "Error al consultar la cuenta $e \n $stacktrace",
      ));
    } catch (e) {
      emit(
          state.copyWith(status: PageStatus.error, errorMessage: e.toString()));
    }
  }
}
