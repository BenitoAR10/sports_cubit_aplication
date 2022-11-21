import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  static Route<void> route(){
    return MaterialPageRoute<void>(builder: (_) => const StartPage());
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.center,
        children: [
          const _StartPageBody(),
        ],
      ),
    );
  }
}

class _StartPageBody extends StatelessWidget {
  const _StartPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Bienvenido a Sports App',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.green
            ),
          ),
          
          const SizedBox(height: 150),
          // Dos botones que navegan a las otras dos pantallas de la app uno al lado del otro.
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/login');
                },
                child: const Text('Login'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/register');
                },
                child: const Text('Register'),
              ),
            ],
          ),
         
        ],
      ),
    );
  }
}