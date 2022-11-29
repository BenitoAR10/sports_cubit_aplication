import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// Creamos una lista de elementos para mostrar los tipos de usuarios que se pueden registrar. 
const List<String> list = <String>['Entrenamiento', 'Proporcionar productos deportivos', 'Dar servicio lugar de entrenamiento', 'Dar servicio de comida', 'Dar servicio de entrenador'];

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({Key? key}) : super(key: key);

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Color.fromARGB(255, 68, 183, 58)),
      underline: Container(
        height: 2,
        color: Color.fromARGB(255, 77, 255, 77),
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
          onTap: () {
            setState(() {
              dropdownValue = value;
              switch (value) {
              case 'Entrenamiento':
                Navigator.of(context).pushReplacementNamed('/register');
                break;
              case 'Proporcionar productos deportivos':
                Navigator.of(context).pushReplacementNamed('/registerStorePage');
                break;
              case 'Dar servicio lugar de entrenamiento':
                Navigator.of(context).pushReplacementNamed('/registerTrainingPlace');
                break;
              case 'Dar servicio de comida':
                Navigator.of(context).pushReplacementNamed('/registerFoodService');
                break;
              case 'Dar servicio de entrenador':
                Navigator.of(context).pushReplacementNamed('/registerCouch');
                break;
              }
            });
            
          },

        );
      }).toList(),
    );
  }
}