import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sports_cubit_aplication/service/LC_agregar_plan_service.dart';

import '../../status/page_status.dart';

part 'LcAddPlanesState.dart';

class LCPlanesAddCubit extends Cubit<AddPlanState> {
  LCPlanesAddCubit() : super(const AddPlanState());

  void reset() {
    emit(const AddPlanState());
  }

  //metodo para registrar un plan
  Future<void> registerPlan({
    required String namePlan,
    required String descripcion,
    required double costoMes,
  }) async {
    emit(state.copyWith(status: PageStatus.loading));
    final storage = FlutterSecureStorage();
    String? idL = await storage.read(key: "ID_L");
    // convertimos el idL a entero
    int idEntero = int.parse(idL!);
    try {
      String response = await AddPlanLCservice.addPlan(
          idEntero, namePlan, descripcion, costoMes) as String;
      emit(state.copyWith(status: PageStatus.success, result: response));
    } catch (e) {
      emit(state.copyWith(status: PageStatus.error, result: e.toString()));
    }
  }
}
