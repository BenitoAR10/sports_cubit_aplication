import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sports_cubit_aplication/cubit/LEN_clientes/LenClientesCubit.dart';
import 'package:sports_cubit_aplication/cubit/LEN_clientes/LenClientesState.dart';

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
      create: (context) => LENclientesCubit()..init(),
      child: BlocBuilder<LENclientesCubit, LENclientesState>(
        builder: (context, state) {
          if (state.status == PageStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == PageStatus.error) {
            return Text("Ha ocurrido un error: ${state.errorMessage}");
          } else {
            if (state.clientesLenDto!.isEmpty) {
              return const Center(
                child: Text("No hay clientes"),
              );
            } else {
              return ListView(children: [
                for (var i = 0; i < state.clientesLenDto!.length; i++)
                  ListTile(
                    title: Text('Cliente ${state.clientesLenDto![i].nombres}'),
                    subtitle: Text(
                        'Meses de membresia: ${state.clientesLenDto![i].cantidadMeses}\nFecha de inicio: ${state.clientesLenDto![i].fechaInicio}\nFecha de fin: ${state.clientesLenDto![i].fechaFin}'),
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
