import 'package:flutter/material.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de Login'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
              child: FlutterLogo(
                size: 40,
              ),
             ),
             Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextField(
                decoration:InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(90.0),
                  ),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextField(
                obscureText: true,
                decoration:InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(90.0),
                  ),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: (){}, 
              child: Text(
                '¿Olvidaste tu contraseña?',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
                child: const Text('Login'),
              ),
            ),
              
          ],
        )
      ),
    );  
  }
}