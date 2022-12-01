import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sports_cubit_aplication/service/LEN_agregar_plan_service.dart';

import '../../status/page_status.dart';

part 'LenAddPlanesState.dart';

class LenPlanesAddCubit extends Cubit<AddPlanState> {
  LenPlanesAddCubit() : super(const AddPlanState());

  void reset() {
    emit(const AddPlanState());
  }

  //metodo para registrar un plan
  Future<void> registerPlan({
    required double costo,
    required int cantidadMeses,
  }) async {
    emit(state.copyWith(status: PageStatus.loading));
    final storage = FlutterSecureStorage();
    String? idL = await storage.read(key: "ID_L");
    // convertimos el idL a entero
    int idEntero = int.parse(idL!);
    try {
      String response =
          await AddPlanLENservice.addPlan(idEntero, costo, cantidadMeses)
              as String;
      emit(state.copyWith(status: PageStatus.success, result: response));
    } catch (e) {
      emit(state.copyWith(status: PageStatus.error, result: e.toString()));
    }
  }
}
