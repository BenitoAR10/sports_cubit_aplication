import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_cubit_aplication/cubit/LC_clientes/LcClientesCubit.dart';
import 'package:sports_cubit_aplication/cubit/LC_clientes/LcClientesState.dart';

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
      create: (context) => LCclientesCubit()..init(),
      child: BlocBuilder<LCclientesCubit, LCclientesState>(
        builder: (context, state) {
          if (state.status == PageStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == PageStatus.error) {
            return Text("Ha ocurrido un error: ${state.errorMessage}");
          } else {
            if (state.clientesLcDto!.isEmpty) {
              return const Center(
                child: Text("No hay clientes"),
              );
            } else {
              return ListView(children: [
                for (var i = 0; i < state.clientesLcDto!.length; i++)
                  ListTile(
                    title: Text(
                        'Cliente ${state.clientesLcDto![i].nombres} ${state.clientesLcDto![i].apellidos}'),
                    subtitle: Text(
                        'Meses de membresia: ${state.clientesLcDto![i].costoMes}\nFecha de inicio: ${state.clientesLcDto![i].fechaCompra}\nFecha de fin: ${state.clientesLcDto![i].fechaFin}\nDetalle: ${state.clientesLcDto![i].detalleComida}'),
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
