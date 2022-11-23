import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_cubit_aplication/login/cubit/app_cubit.dart';
import 'home/ui/home_page.dart';
import 'login/login.dart';
import 'register/register.dart';
import 'start/ui/start_page.dart';


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
          '/':(context) => const StartPage(),
          '/home': (context) => const HomePage(),
          '/login':(context) => const LoginPage(),
          '/register':(context) => const RegisterPage(),
          },       
      ));
  }
}
    
   
  
