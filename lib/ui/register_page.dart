import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:provider/provider.dart';
import 'package:sports_cubit_aplication/ui/gender_widget.dart';

import 'dropwdown_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {



  
  @override
  Widget build(BuildContext context) {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Nueva Cuenta'),
        ),
        // ComboBox para elegir el tipo de usuario
        body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const DropdownButtonExample(),

                // Texto que diga Crear cuenta nueva
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 25),
                    child: Column(
                      children: [
                        Text(
                          'Crear cuenta nueva',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Nombre*',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Apellidos*',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'N* de teléfono*',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 15, 20),
                  child: Column(
                    children: [
                      Text(
                        'Los siguientes datos nos ayudaran a brindarte un servicio más personalizado a tus necesitdades',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade200),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25, right: 495),
                  child: Column(
                    children: [
                      Text(
                        'Elige una opción',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                // invocar widget de genero
                const GenderButton(),

                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Contraseña*',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Repita la contraseña*',
                    ),
                  ),
                ),
              ]),
        ),
      );
    }

    Widget getWidget(bool showOtherGender, bool alignVertical) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 40),
        alignment: Alignment.centerRight,
        child: GenderPickerWithImage(
          showOtherGender: showOtherGender,
          verticalAlignedText: alignVertical,

          // to show what's selected on app opens, but by default it's Male
          selectedGender: Gender.Male,
          selectedGenderTextStyle:
              const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          unSelectedGenderTextStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal),
          onChanged: (Gender? gender) {
            print(gender);
          },
          //Alignment between icons
          equallyAligned: true,

          animationDuration: Duration(milliseconds: 300),
          isCircular: true,
          // default : true,
          opacityOfGradient: 0.4,
          padding: const EdgeInsets.all(3),
          size: 50, //default : 40
        ),
      );
    }

    Widget _getDatePickerEnabled() {
      return InkWell(
        onTap: () {
          _selectDate(context);
        },
        child: InputDecorator(
          decoration: InputDecoration(labelText: _labelText, enabled: true),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                DateFormat.yMMMd().format(_dateSelected),
                style: CustomTheme.of(context).textTheme.subhead.copyWith(),
              ),
              Icon(Icons.arrow_drop_down,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.grey.shade700
                      : Colors.white70),
            ],
          ),
        ),
      );
    }

    Future<void> _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: _dateSelected,
          firstDate: new DateTime(minYear),
          lastDate: new DateTime(maxYear));
      if (picked != null && _onDateChange != null) {
        _onDateChange(picked);
      }
    }
  }
}
