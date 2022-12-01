import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_cubit_aplication/cubit/app_cubit.dart';
import 'package:sports_cubit_aplication/ui/LugarComidapages/homeLC.dart';
import 'package:sports_cubit_aplication/ui/LugarEntrenamientopages/homeLE.dart';
import 'package:sports_cubit_aplication/ui/LugarEntrenamientopages/lista_clientes_page.dart';
import 'package:sports_cubit_aplication/ui/LugarEntrenamientopages/lista_planes_page.dart';
import 'package:sports_cubit_aplication/ui/entrenador/entrenador_page.dart';
import 'package:sports_cubit_aplication/ui/register/register_coach_page.dart';
import 'package:sports_cubit_aplication/ui/LugarEntrenamientopages/cuenta_page.dart';
import 'package:sports_cubit_aplication/ui/select_user_page.dart';
import 'ui/home_page.dart';
import 'ui/login/login_page.dart';
import 'ui/register/register_food_service_page.dart';
import 'ui/register/register_page.dart';
import 'ui/register/register_store_page.dart';
import 'ui/register/register_training_place_page.dart';
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
            '/selectUser': (context) => const ButtonTypesExample(),
            '/login': (context) => const LoginPage(),
            '/register': (context) => RegisterPage(),
            '/registerCouch': (context) => RegisterPageCouch(),
            '/registerTrainingPlace': (context) => RegisterPageTrainingPlace(),
            '/registerFoodService': (context) => RegisterPageFoodService(),
            '/registerStorePage': (context) => RegisterPageStore(),
            '/listaClientesLE': (context) => ListaClientes(),
            '/listaPlanesLE': (context) => ListaPlanes(),
            '/cuentaLE': (context) => CuentaLE(),
            '/homeLE': (context) => const HomeLe(),
            '/homeLC': (context) => const HomeLc(),
            '/datosEntrenador': (context) => DatosEntrenador(),
          },
        ));
  }
}
