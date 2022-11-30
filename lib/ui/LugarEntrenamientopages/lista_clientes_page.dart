import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_cubit_aplication/cubit/LES_clientes/lugar_entrenamiento_sucursal_cubit.dart';
import 'package:sports_cubit_aplication/cubit/LES_clientes/lugar_entrenamiento_sucursal_state.dart';

import 'package:sports_cubit_aplication/status.dart';

class ListaClientes extends StatefulWidget {
  const ListaClientes({Key? key}) : super(key: key);

  @override
  State<ListaClientes> createState() => _ListaClientesState();
}

class _ListaClientesState extends State<ListaClientes> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LESclientesCubit()..init(),
      child: BlocBuilder<LESclientesCubit, LESclientesState>(
        builder: (context, state) {
          if (state.status == PageStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == PageStatus.error) {
            return Text("Ha ocurrido un error: ${state.errorMessage}");
          } else {
            if (state.clientesLeDto!.isEmpty) {
              return const Center(
                child: Text("No hay clientes"),
              );
            } else {
              return ListView(children: [
                for (var i = 0; i < state.clientesLeDto!.length; i++)
                  ListTile(
                    title: Text('Cliente ${state.clientesLeDto![i].nombres}'),
                    subtitle: Text(
                        'Meses de membresia: ${state.clientesLeDto![i].cantidadMeses}\nFecha de inicio: ${state.clientesLeDto![i].fechaInicio}\nFecha de fin: ${state.clientesLeDto![i].fechaFin}'),
                    leading: const Icon(Icons.person),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  )
              ]);
            }
          }
        },
      ),
    );
  }
}
