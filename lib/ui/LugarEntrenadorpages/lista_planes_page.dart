import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_cubit_aplication/cubit/LEN_addPlan/LenAddPlanescubit.dart';
import 'package:sports_cubit_aplication/cubit/LEN_planes/LENplanesCubit.dart';
import 'package:sports_cubit_aplication/cubit/LEN_planes/LenPlanesState.dart';

import 'package:sports_cubit_aplication/status/page_status.dart';
import 'package:sports_cubit_aplication/widgets/show_dialog.dart';

class ListaPlanes extends StatefulWidget {
  const ListaPlanes({Key? key}) : super(key: key);

  @override
  State<ListaPlanes> createState() => _ListaPlanesState();
}

class _ListaPlanesState extends State<ListaPlanes> {
  final _mesesController = TextEditingController();
  final _precioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LENplanesCubit>(
          create: (context) => LENplanesCubit()..init(),
        ),
        BlocProvider<LenPlanesAddCubit>(
          create: (context) => LenPlanesAddCubit(),
        ),
      ],
      child: Scaffold(
          body: Column(children: [
        Expanded(
            child: BlocConsumer<LenPlanesAddCubit, AddPlanState>(
          listener: (ctx, state) {
            // Si el cubir dice cargando, se muestra un dialog que dice cargando
            if (state.status == PageStatus.loading) {
              ShowDialog(context, "Creacion", "Creando Plan", false)
                  .cargando(context, "Creacion", "Creando Plan", false);
            } else if (state.status == PageStatus.success) {
              //actualizamos la pantalla
              Navigator.pop(ctx);
              BlocProvider.of<LENplanesCubit>(ctx).init();
            } else {
              // Si el cubit nos dice que el login fue fallido se muestra un dialog.
              Navigator.pop(ctx); // cerramos el dialogo
              ShowDialog(context, "Error", state.errorMessage!, true)
                  .cargando(context, "Error", state.errorMessage!, true);
            }
          },
          builder: (context, state) {
            return Container(
                color: Colors.green[100],
                //formulario para agregar un nuevo plan
                child: Column(
                  children: [
                    const Text("Agregar un nuevo plan"),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _mesesController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Meses"),
                    ),
                    //espacio entre los textfield
                    const SizedBox(height: 5),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _precioController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Precio"),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          //agregamos el plan
                          BlocProvider.of<LenPlanesAddCubit>(context)
                              .registerPlan(
                                  costo: double.parse(_precioController.text),
                                  cantidadMeses:
                                      int.parse(_mesesController.text));
                        },
                        child: const Text("Guardar"))
                  ],
                ));
          },
        )),
        Divider(
          color: Colors.black,
          thickness: 1,
        ),
        Expanded(
          child: BlocBuilder<LENplanesCubit, LENplanesState>(
            builder: (context, state) {
              if (state.status == PageStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.status == PageStatus.error) {
                return Text("Ha ocurrido un error: ${state.errorMessage}");
              } else {
                if (state.planesLenDto!.isEmpty) {
                  return const Center(
                    child: Text("No hay planes"),
                  );
                } else {
                  return ListView(children: [
                    for (var i = 0; i < state.planesLenDto!.length; i++)
                      ListTile(
                        title: Text(
                            "Meses // ${state.planesLenDto![i].cantidadMeses}"),
                        subtitle:
                            Text("Precio: // ${state.planesLenDto![i].costo}"),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete),
                        ),
                      )
                  ]);
                }
              }
            },
          ),
        ),
      ])),
    );
  }
}
