import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sports_cubit_aplication/cubit/LC_clientes/LcClientesState.dart';
import 'package:sports_cubit_aplication/dto/account_info_dto.dart';
import 'package:sports_cubit_aplication/dto/pagesLugarComida/clientesLugar_dto.dart';
import 'package:sports_cubit_aplication/dto/pagesLugarEntrenador/clientesLugar_dto.dart';
import 'package:sports_cubit_aplication/service/LC_clientes_service.dart';
import 'package:sports_cubit_aplication/service/LEN_clientes_service.dart';

import '../../service/account_service.dart';

import '../../status/page_status.dart';

class LCclientesCubit extends Cubit<LCclientesState> {
  LCclientesCubit() : super(LCclientesState());

  void init() async {
    emit(state.copyWith(status: PageStatus.loading));
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: "TOKEN");
    try {
      if (token != null) {
        // Invocamos al servicio
        AccountInfoDto accountInfoDto =
            await AccountService().getAccountInfo(token);

        List<ClientesLCDto> clientesLeDto =
            await LCclientsService().getClientesLC(accountInfoDto.id!);

        emit(state.copyWith(
          status: PageStatus.success,
          clientesLcDto: clientesLeDto,
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
