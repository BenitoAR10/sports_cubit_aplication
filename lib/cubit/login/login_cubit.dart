import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../dto/login_response_dto.dart';
import '../../service/login_service.dart';
import '../../status/page_status.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Future<void> login(String correo, String contrasenia) async{
    final storage = FlutterSecureStorage(); // FlutterSecureStorage es una libreria que permite almacenar datos de forma segura en el dispositivo
    // Le indicamos al front que estamos iniciando el proceso de login
    emit(state.copyWith(status: PageStatus.loading));
    try{
      // Como el movil no sabe como validar a la cuenta y contraseña entonces 
      // invoca al back para que este se encargue a travez de una clase service 
      LoginResponseDto response = await LoginService.login(correo, contrasenia);
      // Si el back nos responde con un token y un refreshToken entonces el login fue exitoso y guardamos ese token en el dispositivo
      await storage.write(key: "TOKEN", value: response.token);
      await storage.write(key: "REFRESH", value: response.refresh);
      emit(state.copyWith(
        loginSuccess: true,
        status: PageStatus.success,
        token: response.token,
        refreshToken: response.refresh,
      ));
    }on Exception catch (e){
      emit(state.copyWith(
        loginSuccess: false,
        status: PageStatus.error,
        errorMessage: e.toString(),
        exception: e,
      ));
    }
  }
}
