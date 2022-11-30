import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sports_cubit_aplication/dto/account_info_dto.dart';

import '../../dto/pagesLugarEntrenamiento/responseDatosLugar_dto.dart';
import '../../service/account_service.dart';
import '../../service/lugar_entrenamiento_sucursal_service.dart';
import '../../status/page_status.dart';
import 'lugar_entrenamiento_sucursal_state.dart';

class LugarEntrenamientoSucursalCubit
    extends Cubit<LugarEntrenamientoSucursalState> {
  LugarEntrenamientoSucursalCubit() : super(LugarEntrenamientoSucursalState());

  void init() async {
    emit(state.copyWith(status: PageStatus.loading));
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: "TOKEN");
    try {
      if (token != null) {
        // Invocamos al servicio
        AccountInfoDto accountInfoDto =
            await AccountService().getAccountInfo(token);
        print(accountInfoDto.id);

        InfoLugarEntrenamientoDto lugarEntrenamientoSucursalDto =
            await LugarEntrenamientoSucursalService()
                .getLugarEntrenamientoSucursal(accountInfoDto.id!);

        emit(state.copyWith(
          status: PageStatus.success,
          lugarEntrenamientoSucursalDto: lugarEntrenamientoSucursalDto,
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
