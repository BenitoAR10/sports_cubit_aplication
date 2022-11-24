import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_cubit_aplication/cubit/app_cubit.dart';
import 'ui/home_page.dart';
import 'ui/login_form.dart';
import 'ui/register_page.dart';
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
          '/':(context) => const StartPage(),
          '/home': (context) => const HomePage(),
          '/login':(context) => const LoginPage(),
          '/register':(context) => const RegisterPage(),
          },       
      ));
  }
}
    
   
  
