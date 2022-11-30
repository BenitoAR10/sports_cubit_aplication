import 'package:bloc/bloc.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:sports_cubit_aplication/cubit/LES_planes/LesPlanesState.dart';
import 'package:sports_cubit_aplication/dto/account_info_dto.dart';

import 'package:sports_cubit_aplication/dto/pagesLugarEntrenamiento/planesLugar_dto.dart';

import 'package:sports_cubit_aplication/service/lugar_entrenamiento_planes_service.dart';

import '../../service/account_service.dart';

import '../../status/page_status.dart';

class LESplanesCubit extends Cubit<LESplanesState> {
  LESplanesCubit() : super(LESplanesState());

  void init() async {
    emit(state.copyWith(status: PageStatus.loading));
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: "TOKEN");
    try {
      if (token != null) {
        // Invocamos al servicio
        AccountInfoDto accountInfoDto =
            await AccountService().getAccountInfo(token);

        List<PlanesLeDto> planesLeDto =
            await LugarEplanesService().getplanesLE(accountInfoDto.id!);

        emit(state.copyWith(
          status: PageStatus.success,
          planesLeDto: planesLeDto,
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
