import 'package:flutter/material.dart';
import 'login/login.dart';
import 'register/register.dart';
import 'start/ui/start_page.dart';


void main() {
  runApp(MaterialApp(
      title: 'Sporst App',
      initialRoute: '/',
      routes: {
        '/':(context) => const StartPage(),
        '/login':(context) => const LoginForm(),
        '/register':(context) => const RegisterPage(),
      },
    )
  );
}