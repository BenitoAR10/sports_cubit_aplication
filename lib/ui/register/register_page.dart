import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_cubit_aplication/widgets/show_dialog.dart';
import '../../cubit/register/register_cubit.dart';
import '../../status/page_status.dart';
import '../../widgets/validator_util.dart';
import '../dropwdown_widget.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final _nombresController = TextEditingController();
  final _apellidosController = TextEditingController();
  final _numeroTelefonoController = TextEditingController();
  final _correController = TextEditingController();
  final _contraseniaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nueva cuenta'),
        ),
        body: BlocConsumer<RegisterCubit, RegisterState>(
         listener: (ctx3, state) {
              // Si el cubir dice cargando, se muestra un dialog que dice cargando
              if (state.status == PageStatus.loading) {
                ShowDialog(context, "Creacion",
                    "Creando la cuenta", false);
              } else if (state.status == PageStatus.success) {             
                Navigator.pop(ctx3);
                Navigator.of(context).popUntil((route) => route.isFirst);
              } else {
                // Si el cubit nos dice que el login fue fallido se muestra un dialog.
                Navigator.pop(ctx3); // cerramos el dialogo
                ShowDialog(context, "Error", state.errorMessage!, true);
              }
            },
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            child: Column(
                              children: [
                                const Image(
                                    image: AssetImage("assets/sportsApp.jpg"),
                                    height: 200),
                                Expanded(child: _accountRegisterForm(context))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _accountRegisterForm(BuildContext context) {
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              autocorrect: false,
              decoration: const InputDecoration(labelText: 'Nombre*'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese su nombre';
                }
                return null;
              },
              controller: _nombresController,
            ),
            TextFormField(
              autocorrect: false,
              decoration: const InputDecoration(labelText: 'Apellidos*'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese su apellido';
                }
                return null;
              },
              controller: _apellidosController,
            ),
            TextFormField(
              autocorrect: false,
              decoration: const InputDecoration(labelText: 'N* de teléfono*'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese su número de teléfono';
                }
                return null;
              },
              controller: _numeroTelefonoController,
            ),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Correo*'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese su correo';
                } else if (!ValidatorUtil.validateEmail(value)) {
                  return 'Por favor ingrese un correo válido';
                }
                return null;
              },
              controller: _correController,
            ),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Contraseña*'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese su contraseña';
                } else if (!ValidatorUtil.validatePassword(value)) {
                  return 'Por favor ingrese una contraseña válida';
                }
                return null;
              },
              controller: _contraseniaController,
            ),
            Container(
              height: 55,
              padding: const EdgeInsets.only(top: 5, left: 70, right: 70),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Colors.green,
                // Los eventos desde la vista se envian al cubit
                onPressed: () {
                  BlocProvider.of<RegisterCubit>(context).registerAccount(
                      nombres: _nombresController.text,
                      apellidos: _apellidosController.text,
                      numeroTelefono: _numeroTelefonoController.text,
                      correo: _correController.text,
                      contrasenia: _contraseniaController.text);
                },
                child: Text(
                  'Crear',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  void _cleanControllers() {
    _nombresController.clear();
    _apellidosController.clear();
    _numeroTelefonoController.clear();
    _correController.clear();
    _contraseniaController.clear();
  }
}

//  resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: const Text('Nueva Cuenta'),
//       ),
//       // ComboBox para elegir el tipo de usuario
//       body: Center(
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               const DropdownButtonExample(),

//               // Texto que diga Crear cuenta nueva
//               Container(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 10, left: 25),
//                   child: Column(
//                     children: [
//                       Text(
//                         'Crear cuenta nueva',
//                         style: TextStyle(
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.green),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               Container(
//                 padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     labelText: 'Nombre*',
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//                 child: TextField(
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     labelText: 'Apellidos*',
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//                 child: TextField(
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     labelText: 'N* de teléfono*',
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(20, 30, 15, 20),
//                 child: Column(
//                   children: [
//                     Text(
//                       'Los siguientes datos nos ayudaran a brindarte un servicio más personalizado a tus necesitdades',
//                       style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.green.shade200),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 25, right: 495),
//                 child: Column(
//                   children: [
//                     Text(
//                       'Elige una opción',
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black54),
//                     ),
//                   ],
//                 ),
//               ),
//               // invocar widget de genero
//               const GenderButton(),

//               Container(
//                 padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     labelText: 'Contraseña*',
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     labelText: 'Repita la contraseña*',
//                   ),
//                 ),
//               ),
//             ]),
//       ),