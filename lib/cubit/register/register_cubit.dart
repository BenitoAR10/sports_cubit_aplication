import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../service/register_service.dart';
import '../../status/page_status.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  void reset() {
    emit(const RegisterState());
  }

  // Metodo para registrar un usuario normal
  Future<void> registerAccount({
    required String nombre,
    required String apellido,
    required String numeroTelefono,
    required String correo,
    required String contrasenia,
  }) async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      String response = await RegisterService.registerAccount(
          correo, contrasenia, nombre, apellido, numeroTelefono) as String;
      emit(state.copyWith(status: PageStatus.success, result: response));
    } catch (e) {
      emit(state.copyWith(status: PageStatus.error, result: e.toString()));
    }
  }

  // Metodo para registrar un usuario entrenador
  Future<void> registerAccountCouch({
    required String nombre,
    required String apellido,
    required String numeroTelefono,
    required String correo,
    required String contrasenia,
  }) async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      String response = await RegisterService.registerAccount(
          correo, contrasenia, nombre, apellido, numeroTelefono) as String;
      emit(state.copyWith(status: PageStatus.success, result: response));
    } catch (e) {
      emit(state.copyWith(status: PageStatus.error, result: e.toString()));
    }
  }

  // Metodo para registrar un usuario que ofrezca servicio de comida
  Future<void> registerAccountFoodService({
    required String nombre,
    required String apellido,
    required String numeroTelefono,
    required String correo,
    required String contrasenia,
  }) async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      String response = await RegisterService.registerAccount(
          correo, contrasenia, nombre, apellido, numeroTelefono) as String;
      emit(state.copyWith(status: PageStatus.success, result: response));
    } catch (e) {
      emit(state.copyWith(status: PageStatus.error, result: e.toString()));
    }
  }

  // Metodo para registrar un usuario que venda productos
  Future<void> registerAccountStore({
    required String nombre,
    required String apellido,
    required String numeroTelefono,
    required String correo,
    required String contrasenia,
  }) async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      String response = await RegisterService.registerAccount(
          correo, contrasenia, nombre, apellido, numeroTelefono) as String;
      emit(state.copyWith(status: PageStatus.success, result: response));
    } catch (e) {
      emit(state.copyWith(status: PageStatus.error, result: e.toString()));
    }
  }

  // Metodo para registrar un usuario que ofrezca lugares de entrenaiento
  Future<void> registerAccountTrainingPlace({
    required String nombre,
    required String apellido,
    required String numeroTelefono,
    required String correo,
    required String contrasenia,
  }) async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      String response = await RegisterService.registerAccount(
          correo, contrasenia, nombre, apellido, numeroTelefono) as String;
      emit(state.copyWith(status: PageStatus.success, result: response));
    } catch (e) {
      emit(state.copyWith(status: PageStatus.error, result: e.toString()));
    }
  }
}
