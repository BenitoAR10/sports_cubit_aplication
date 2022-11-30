import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_cubit_aplication/cubit/lugar_entrenamiento_s/lugar_entrenamiento_sucursal_cubit.dart';
import 'package:sports_cubit_aplication/cubit/lugar_entrenamiento_s/lugar_entrenamiento_sucursal_state.dart';
import 'package:sports_cubit_aplication/dto/pagesLugarEntrenamiento/responseDatosLugar_dto.dart';

import 'package:sports_cubit_aplication/status/page_status.dart';
import 'package:sports_cubit_aplication/ui/LugarEntrenamientopages/lista_clientes_page.dart';

class HomeLe extends StatefulWidget {
  const HomeLe({Key? key}) : super(key: key);

  @override
  State<HomeLe> createState() => _HomeLeState();
}

class _HomeLeState extends State<HomeLe> {
  var _currentPage = 0;
  var _pages = [ListaClientes(), Text("Página 2"), Text("Página 3")];
  var _colores = [Colors.green[200], Colors.yellow, Colors.blue[200]];
  var _color = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LugarEntrenamientoSucursalCubit()..init(),
      child: BlocBuilder<LugarEntrenamientoSucursalCubit,
          LugarEntrenamientoSucursalState>(
        builder: (context, state) {
          if (state.status == PageStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == PageStatus.error) {
            return Text("Ha ocurrido un error: ${state.errorMessage}");
          } else {
            return Scaffold(
              body: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          // padding top hasta la barra de navegación
                          padding: const EdgeInsets.only(top: 45),
                          child: Container(
                            height: 125,
                            color: Colors.green[200],
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    "${state.lugarEntrenamientoSucursalDto!.nombre}",
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20)),
                                Text(
                                    "Dirección: ${state.lugarEntrenamientoSucursalDto!.direccion}",
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 15)),
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          "https://www.boliviaentusmanos.com/amarillas/blogos/energym.jpg"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: _colores[_color],
                        child: _pages[_currentPage],
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    label: 'Lista Clientes',
                    backgroundColor: Color.fromARGB(255, 7, 255, 61),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.money),
                    label: 'Planes',
                    backgroundColor: Colors.amber,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_box_rounded),
                    label: 'Cuenta',
                    backgroundColor: Colors.amber,
                  ),
                ],
                currentIndex: _currentPage,
                selectedItemColor: Colors.green,
                onTap: (value) => setState(() {
                  _currentPage = value;
                  _color = value;
                }),
              ),
            );
          }
        },
      ),
    );
  }
}
