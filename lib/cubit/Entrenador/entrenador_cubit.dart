import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sports_cubit_aplication/service/entrenador_service.dart';

import '../../status/page_status.dart';

part 'entrenador_state.dart';

class EntrenadorCubit extends Cubit<EntrenadorState> {
  EntrenadorCubit() : super(const EntrenadorState());

  Future<void> registrarDatosEntrenador({
    required int idCuenta,
    required String nit,
    required String correo,
    String? fotoEntrenador,
    String? token,
  }) async{
    emit(state.copyWith(status: PageStatus.loading));
    try{
      String result = await EntrenadorService.registrarDatosEntrenador(idCuenta, fotoEntrenador, nit, correo, token!);
      emit(state.copyWith(status: PageStatus.success, message: result));
    }catch (e){
      emit(state.copyWith(status: PageStatus.error, message: e.toString()));
    }
  }
}
