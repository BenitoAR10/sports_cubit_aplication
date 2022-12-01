import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sports_cubit_aplication/dto/entrenador_dto.dart';
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
  }) async{
    final storage = new FlutterSecureStorage();
    emit(state.copyWith(status: PageStatus.loading));
    String? token = await storage.read(key: 'TOKEN');

    try{
      String response = await EntrenadorService.registrarDatosEntrenador(idCuenta, fotoEntrenador, nit, correo, token!) as String;
      emit(state.copyWith(status: PageStatus.success, message: response));
    }catch(e){
      emit(state.copyWith(status: PageStatus.error, message: e.toString()));
    } 
    // le indicamos al front que estamos iniciando el proceso de registro
  }
}
