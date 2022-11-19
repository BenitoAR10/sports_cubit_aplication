import 'package:flutter/material.dart';
import 'pages/login/login.dart';
import 'pages/start/view/start_page.dart';
import 'pages/register/register.dart';


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