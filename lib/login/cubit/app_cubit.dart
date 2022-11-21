import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_cubit_aplication/dto/login_response_dto.dart';

import '../../service/login_service.dart';

class AppState{
  final bool isUserLoggedIn;
  final bool isLoading;
  final LoginResponseDto? loginResponseDto;

  const AppState({
    this.isUserLoggedIn = false,
    this.isLoading = false,
    this.loginResponseDto,
  });
}
class AppCubit extends Cubit<AppState> {
    AppCubit() : super(const AppState(isUserLoggedIn: false, isLoading: false));

    // Logica de negocio para hacer el login contra el backend

    void login (String correo, String contrasenia) async{
      // Emitir un evento para indicar que estamos cargando
      emit(AppState(isUserLoggedIn: false, isLoading: true));
      await Future.delayed(const Duration(seconds: 3));
      try{
        var loginResponseDto = await LoginService.login(correo, contrasenia);
        // Si lo anterios salio bien enviamos un evento para que el front sepa que el login fue exitoso
        emit(AppState(
          isUserLoggedIn: true,
          isLoading: false,
          loginResponseDto: loginResponseDto,
        ));
      } catch (e){
        // Si lo anterior fallo enviamos un evento para que el front sepa que el login fallo
        emit(AppState(
          isUserLoggedIn: false,
          isLoading: false,
          loginResponseDto: null,
        ));
      }
    }

    void logout(){
      emit(AppState(isUserLoggedIn: false, isLoading: false));
    }
  }