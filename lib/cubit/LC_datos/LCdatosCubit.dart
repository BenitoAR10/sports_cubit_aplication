import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sports_cubit_aplication/cubit/LC_datos/LCdatosState.dart';
import 'package:sports_cubit_aplication/dto/account_info_dto.dart';
import 'package:sports_cubit_aplication/dto/pagesLugarComida/responseDatosLugar_dto.dart';
import 'package:sports_cubit_aplication/dto/pagesLugarEntrenador/responseDatosLugar_dto.dart';
import 'package:sports_cubit_aplication/service/LC_datos_service.dart';

import '../../service/account_service.dart';
import '../../service/LEN_datos_service.dart';
import '../../status/page_status.dart';

class LCdatosCubit extends Cubit<LCdatosState> {
  LCdatosCubit() : super(LCdatosState());

  void init() async {
    emit(state.copyWith(status: PageStatus.loading));
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: "TOKEN");
    try {
      if (token != null) {
        // Invocamos al servicio
        AccountInfoDto accountInfoDto =
            await AccountService().getAccountInfo(token);

        DatosLC datosDto = await LCService().get(accountInfoDto.id!);

        //guardar en el storage el id del lugar de entrenamiento
        await storage.write(
            key: "ID_L", value: datosDto.idLugarComida.toString());

        emit(state.copyWith(
          status: PageStatus.success,
          datosLC: datosDto,
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
