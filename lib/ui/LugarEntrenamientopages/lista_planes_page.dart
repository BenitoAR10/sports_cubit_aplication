import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_cubit_aplication/cubit/LES_addPlan/LesAddPlanescubit.dart';
import 'package:sports_cubit_aplication/cubit/LES_planes/LesPlanesState.dart';
import 'package:sports_cubit_aplication/cubit/LES_planes/LesPlanescubit.dart';
import 'package:sports_cubit_aplication/status/page_status.dart';
import 'package:sports_cubit_aplication/widgets/show_dialog.dart';

import '../../widgets/navbar_users_spacials.dart';

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
        BlocProvider<LESplanesCubit>(
          create: (context) => LESplanesCubit()..init(),
        ),
        BlocProvider<LesPlanesAddCubit>(
          create: (context) => LesPlanesAddCubit(),
        ),
      ],
      child: Scaffold(
          body: Column(children: [
        Expanded(
            child: BlocConsumer<LesPlanesAddCubit, AddPlanState>(
          listener: (ctx, state) {
            // Si el cubir dice cargando, se muestra un dialog que dice cargando
            if (state.status == PageStatus.loading) {
              ShowDialog(context, "Creacion", "Creando Plan", false)
                  .cargando(context, "Creacion", "Creando Plan", false);
            } else if (state.status == PageStatus.success) {
              //actualizamos la pantalla
              Navigator.pop(ctx);
              BlocProvider.of<LESplanesCubit>(ctx).init();
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
                          BlocProvider.of<LesPlanesAddCubit>(context)
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
          child: BlocBuilder<LESplanesCubit, LESplanesState>(
            builder: (context, state) {
              if (state.status == PageStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.status == PageStatus.error) {
                return Text("Ha ocurrido un error: ${state.errorMessage}");
              } else {
                if (state.planesLeDto!.isEmpty) {
                  return const Center(
                    child: Text("No hay planes"),
                  );
                } else {
                  return ListView(children: [
                    for (var i = 0; i < state.planesLeDto!.length; i++)
                      ListTile(
                        title: Text(
                            "Meses // ${state.planesLeDto![i].cantidadMeses}"),
                        subtitle:
                            Text("Precio: // ${state.planesLeDto![i].costo}"),
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
