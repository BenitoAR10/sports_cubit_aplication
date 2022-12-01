import 'package:bloc/bloc.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sports_cubit_aplication/cubit/LEN_planes/LenPlanesState.dart';

import 'package:sports_cubit_aplication/dto/account_info_dto.dart';
import 'package:sports_cubit_aplication/dto/pagesLugarEntrenador/planesLugar_dto.dart';

import 'package:sports_cubit_aplication/service/LEN_planes_service.dart';

import '../../service/account_service.dart';

import '../../status/page_status.dart';

class LENplanesCubit extends Cubit<LENplanesState> {
  LENplanesCubit() : super(const LENplanesState());

  void init() async {
    emit(state.copyWith(status: PageStatus.loading));
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: "TOKEN");
    try {
      if (token != null) {
        // Invocamos al servicio
        AccountInfoDto accountInfoDto =
            await AccountService().getAccountInfo(token);

        List<PlanesLenDto> planesLenDto =
            await LugarEplanesService().getplanesLEN(accountInfoDto.id!);

        emit(state.copyWith(
          status: PageStatus.success,
          planesLenDto: planesLenDto,
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
