

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sports_cubit_aplication/dto/account_info_dto.dart';
import 'package:sports_cubit_aplication/cubit/home/home_page_state.dart';

import '../../service/account_service.dart';
import '../../status/page_status.dart';

class HomePageCubit extends Cubit<HomePageState>{
  HomePageCubit() : super(const HomePageState());

  void init() async{
    // le indicamos al front que estamos ocupados
    emit(state.copyWith(status: PageStatus.loading));
    // Vamos a traer la informacion de la cuenta, para eso
    // necesitamos el token con su identida 
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: "TOKEN");
    try{
      if(token != null){
        // Invocamos al servicio
        AccountInfoDto accountInfoDto = await AccountService().getAccountInfo(token);
        emit(state.copyWith(
          status: PageStatus.success,
          accountInfoDto: accountInfoDto,
        ));
        
      }else{
        // TODO no hay token debe ir a login
        emit(state.copyWith(
          status: PageStatus.error,
          errorMessage: "Usuario no autenticado",
        ));

      } 
    }on Exception catch (e, stacktrace){
      emit(state.copyWith(
        status: PageStatus.error,
        errorMessage: "Error al consultar la cuenta $e \n $stacktrace",
      ));
    }
  }
}
