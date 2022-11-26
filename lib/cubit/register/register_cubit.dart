import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../service/register_service.dart';
import '../../status/page_status.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  void reset(){
    emit(const RegisterState());
  }

  Future<void> registerAccount({
    required String nombres,
    required String apellidos,
    required String numeroTelefono,
    required String correo,
    required String contrasenia,
  }) async {
    emit(state.copyWith(status: PageStatus.loading));
    try{
      String response = await RegisterService.registerAccount(
        nombres, apellidos, numeroTelefono, correo, contrasenia) as String;
        emit (state.copyWith(status: PageStatus.success, result: response));
    } catch (e){
      emit(state.copyWith(status: PageStatus.error, result: e.toString()));
    }
  }
}
