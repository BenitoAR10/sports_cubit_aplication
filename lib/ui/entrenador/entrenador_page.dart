import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_cubit_aplication/cubit/Entrenador/entrenador_cubit.dart';
import 'package:sports_cubit_aplication/status/page_status.dart';

import '../../widgets/show_dialog.dart';

class DatosEntrenador extends StatelessWidget {
  DatosEntrenador({Key? key}) : super(key: key);
  final _nitEntrenadorController = TextEditingController();
  final _correoEntrenadorController = TextEditingController();
  final _fotoEntrenadorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EntrenadorCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("SPORTS APP"),
        ),
        body: BlocConsumer<EntrenadorCubit, EntrenadorState>(
          listener: (ctx3, state) {
            if (state.status == PageStatus.loading) {
              ShowDialog(
                  context, "Creacion", "Cargando datos del entrenador", false);
            } else if (state.status == PageStatus.success) {
              Navigator.pop(ctx3);
            } else {
              Navigator.pop(ctx3);
              ShowDialog(context, "Creacion",
                  "Error al cargar los datos de entrenador", true);
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
                                    const EdgeInsets.only(top: 20, right: 50),
                                child: const Text(
                                  'Datos de Entrenador',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                  child:
                                      _registrarDatosEntrenador(context, state))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _registrarDatosEntrenador(
      BuildContext context, EntrenadorState state) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Deporte a entrenar',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.grey[800],
                  ),
                  // fotoEntrenador: state.fotoEntrenador, ?? 'assets/images/usuario.png',
                )
              ],
            ),
            TextFormField(
              autocorrect: false,
              decoration: const InputDecoration(
                labelText: 'NIT/CI*',
                hintText: 'Ingrese su NIT/CI',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese un NIT/CI';
                }
                return null;
              },
              controller: _nitEntrenadorController,
            ),
             TextFormField(
              autocorrect: false,
              decoration: const InputDecoration(
                labelText: 'Correo electronico*',
                hintText: 'Ingrese un correo electronico',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese un correo electronico';
                }
                return null;
              },
              controller: _correoEntrenadorController,
            )
          ],
        ),
      ),
    );
  }
   void _cleanControllers() {
    _nitEntrenadorController.clear();
    _correoEntrenadorController.clear();
  }
}
