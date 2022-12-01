import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_cubit_aplication/cubit/Cuenta/cuenta_cubit.dart';
import 'package:sports_cubit_aplication/cubit/Cuenta/cuenta_state.dart';
import 'package:sports_cubit_aplication/status/page_status.dart';

import '../../widgets/navbar_users_spacials.dart';

class CuentaLE extends StatefulWidget {
  const CuentaLE({Key? key}) : super(key: key);

  @override
  State<CuentaLE> createState() => _CuentaLEState();
}

class _CuentaLEState extends State<CuentaLE> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AcercaCuentaCubit()..init(),
      child: BlocBuilder<AcercaCuentaCubit, AcercaCuentaState>(
        builder: (context, state) {
          if (state.status == PageStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == PageStatus.error) {
            return Text("Ha ocurrido un error: ${state.errorMessage}");
          } else {
            return Scaffold(
              //crear una pagina con la informacion de la cuenta
              body: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //imagen de la cuenta circular
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("assets/profiledef.png"),
                      ),
                      //datos de la cuenta centrados
                      Text("Nombre: ${state.accountInfoDto!.nombre}"),
                      Text("Correo: ${state.accountInfoDto!.correo}"),
                      Text("Telefono: ${state.accountInfoDto!.telefono}"),
                      Text("Horario LUNES A VIERNES DE 8:00 AM A 6:00 PM"),

                      //boton rojo para cerrar sesion
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cerrar Sesión"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          onPrimary: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
