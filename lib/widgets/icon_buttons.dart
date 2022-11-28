import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonTypesExample extends StatelessWidget {
  const ButtonTypesExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: const <Widget>[
          Spacer(),
          ButtonTypesGroup(enabled: true),
          Spacer(),
        ],
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
              onPressed: (){
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
              onPressed: onPressed,
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
