import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_cubit_aplication/cubit/LC_addPlan/LcAddPlanescubit.dart';
import 'package:sports_cubit_aplication/cubit/LC_planes/LcPlanesState.dart';
import 'package:sports_cubit_aplication/cubit/LC_planes/LcPlanescubit.dart';

import 'package:sports_cubit_aplication/status/page_status.dart';
import 'package:sports_cubit_aplication/widgets/show_dialog.dart';

import '../../widgets/navbar_users_spacials.dart';

class ListaPlanes extends StatefulWidget {
  const ListaPlanes({Key? key}) : super(key: key);

  @override
  State<ListaPlanes> createState() => _ListaPlanesState();
}

class _ListaPlanesState extends State<ListaPlanes> {
  final _nombrePlan = TextEditingController();
  final _precioController = TextEditingController();
  final _descripcionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LCplanesCubit>(
          create: (context) => LCplanesCubit()..init(),
        ),
        BlocProvider<LCPlanesAddCubit>(
          create: (context) => LCPlanesAddCubit(),
        ),
      ],
      child: Column(children: [
        Expanded(
            child: BlocConsumer<LCPlanesAddCubit, AddPlanState>(
          listener: (ctx, state) {
            // Si el cubir dice cargando, se muestra un dialog que dice cargando
            if (state.status == PageStatus.loading) {
              ShowDialog(context, "Creacion", "Creando Plan", false)
                  .cargando(context, "Creacion", "Creando Plan", false);
            } else if (state.status == PageStatus.success) {
              //actualizamos la pantalla
              Navigator.pop(ctx);
              BlocProvider.of<LCplanesCubit>(ctx).init();
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
                      controller: _nombrePlan,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Nombre Plan"),
                    ),
                    //espacio entre los textfield
                    const SizedBox(height: 5),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _precioController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Precio x Mes"),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: _descripcionController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Descripcion"),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          //agregamos el plan
                          BlocProvider.of<LCPlanesAddCubit>(context)
                              .registerPlan(
                                  namePlan: _nombrePlan.text,
                                  descripcion: _descripcionController.text,
                                  costoMes:
                                      double.parse(_precioController.text));
                        },
                        child: const Text("Guardar"))
                  ],
                ));
          },
        )),
        Expanded(
          child: BlocBuilder<LCplanesCubit, LCplanesState>(
            builder: (context, state) {
              if (state.status == PageStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.status == PageStatus.error) {
                return Text("Ha ocurrido un error: ${state.errorMessage}");
              } else {
                if (state.planesLCDto!.isEmpty) {
                  return const Center(
                    child: Text("No hay planes"),
                  );
                } else {
                  return ListView(children: [
                    for (var i = 0; i < state.planesLCDto!.length; i++)
                      ListTile(
                        title:
                            Text("Plan // ${state.planesLCDto![i].nombrePlan}"),
                        subtitle: Text(
                            "Descripcion: // ${state.planesLCDto![i].descripcion}\n  // Precio x Mes Bs: // ${state.planesLCDto![i].costoMes}"),
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
      ]),
    );
  }
}
