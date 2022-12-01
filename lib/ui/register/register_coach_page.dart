import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_strength/flutter_password_strength.dart';
import 'package:sports_cubit_aplication/widgets/show_dialog.dart';
import '../../cubit/register/register_cubit.dart';
import '../../status/page_status.dart';
import '../../widgets/validator.dart';


class RegisterPageCouch extends StatelessWidget {
  RegisterPageCouch({Key? key}) : super(key: key);

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
              ShowDialog sd = ShowDialog(context, "Creacion", "Creando la cuenta", false);
              sd.cargando(context, "Creacion", "Creando la cuenta", false);
            } else if (state.status == PageStatus.success) {
              Navigator.pop(ctx3);
              Navigator.of(context).pushNamed('/datosEntrenador');
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
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 20, right: 40),
                                  child: const Text(
                                    'Nueva cuenta de entrenador',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(child: _accountRegisterForm(context))
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // TextFormField en el centro de la pantalla
            Container(
              height: 600,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      autocorrect: false,
                      decoration: const InputDecoration(
                        labelText: 'Nombres*',
                        hintText: 'Ingrese sus nombres',
                        border: OutlineInputBorder(),
                      ),
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
                      decoration: const InputDecoration(
                        labelText: 'Apellidos*',
                        hintText: 'Ingrese sus apellidos',
                        border: OutlineInputBorder(),
                      ),
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
                      decoration: const InputDecoration(
                          labelText: 'N* de teléfono*',
                          hintText: 'Ingrese su número de teléfono',
                          border: OutlineInputBorder()),
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
                      decoration: const InputDecoration(
                          labelText: 'Correo*', border: OutlineInputBorder()),
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
                      decoration: const InputDecoration(
                          labelText: 'Contraseña*',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su contraseña';
                        } else if (value.length < 8) {
                          return 'La contraseña debe tener al menos 8 caracteres';
                        }
                        return null;
                      },
                      controller: _contraseniaController,
                    ),
                    TextFormField(
                      autocorrect: false,
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: 'Repita su contraseña*',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor confirme su contraseña';
                        } else if (value != _contraseniaController.text) {
                          return 'Las contraseñas no coinciden';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    FlutterPasswordStrength(
                        password: _contraseniaController.text,
                        strengthCallback: (strength) {
                          debugPrint(strength.toString());
                        }),
                    Container(
                      height: 55,
                      padding:
                          const EdgeInsets.only(top: 5, left: 70, right: 70),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        // Los eventos desde la vista se envian al cubit
                        onPressed: () {
                          BlocProvider.of<RegisterCubit>(context)
                              .registerAccountCouch(
                                  correo: _correController.text,
                                  contrasenia: _contraseniaController.text,
                                  nombre: _nombresController.text,
                                  apellido: _apellidosController.text,
                                  numeroTelefono:
                                      _numeroTelefonoController.text);
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
