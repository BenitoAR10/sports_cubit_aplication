import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_cubit_aplication/cubit/app_cubit.dart';
import 'package:sports_cubit_aplication/ui/LugarEntrenamientopages/lista_clientes.dart';
import 'package:sports_cubit_aplication/ui/LugarEntrenamientopages/lista_planes.dart';
import 'package:sports_cubit_aplication/ui/register/register_coach_page.dart';
import 'package:sports_cubit_aplication/ui/LugarEntrenamientopages/cuenta.dart';
import 'ui/home_page.dart';
import 'ui/login/login_page.dart';
import 'ui/register/register_page.dart';
import 'ui/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit(),
        child: MaterialApp(
          title: 'Sporst App',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const StartPage(),
            '/home': (context) => const HomePage(),
            '/login': (context) => const LoginPage(),
            '/register': (context) => RegisterPage(),
            '/registerCouch': (context) => RegisterPageCouch(),
            '/listaClientesLE': (context) => const ListaClientes(),
            '/listaPlanesLE': (context) => const ListaPlanes(),
            '/cuentaLE': (context) => const CuentaLE(),
          },
        ));
  }
}
