import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonTypesExample extends StatelessWidget {
  const ButtonTypesExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecciona tu tipo de usuario'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Column(
                children: [
                  const Image(
                      image: AssetImage('assets/sportsApp.jpg'), height: 200),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Entrenamiento'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/registerCouch');
              },
              child: const Text('Entrenador'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/registerTrainingPlace');
              },
              child: const Text('Dar servicio Lugar de entrenamiento'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/registerFoodService');
              },
              child: const Text('Dar servicio de comida'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/registerStorePage');
              },
              child: const Text('Proporcionar productos deportivos'),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonTypesGroup extends StatelessWidget {
  const ButtonTypesGroup({Key? key, required this.enabled}) : super(key: key);

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final VoidCallback? onPressed = enabled ? () {} : null;
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(children: [
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: onPressed,
              iconSize: 35,
              tooltip: 'IconButton',
            ),
            IconButton(
              icon: const Icon(Icons.keyboard_backspace),
              onPressed: () {
                Navigator.pop(context, "/");
              },
              iconSize: 35,
              tooltip: 'Salir',
            ),
          ]),
          Column(children: [
            IconButton(
              icon: new Image.asset('assets/store-front.png'),
              onPressed: onPressed,
              color: colors.primary,
              iconSize: 35,
              tooltip: 'Vender productos',
            ),
            IconButton(
              icon: new Image.asset('assets/pesa.png'),
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed('/registerCouch'),
              iconSize: 35,
              tooltip: 'Dar servicio de lugar entrenamiento',
            ),
          ]),
          Column(children: [
            IconButton(
              icon: new Image.asset('assets/dieta.png'),
              onPressed: onPressed,
              color: colors.primary,
              iconSize: 35,
              tooltip: 'Dar servicio de comida',
            ),
            IconButton(
              icon: const Icon(Icons.sports),
              onPressed: onPressed,
              iconSize: 35,
              tooltip: 'Dar servicio de entrenador',
            ),
          ]),
        ],
      ),
    );
  }
}
