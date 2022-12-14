import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// Creamos una lista de elementos para mostrar los tipos de usuarios que se pueden registrar. 
const List<String> list = <String>['Atletismo', 'Basketball', 'Fútbol', 'Tenis', 'Voleibol'];

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
            // This is called when the user selects an item.
            setState(() {
              dropdownValue = value;
            });
          
            
          },

        );
      }).toList(),
    );
  }
}