import 'package:flutter/material.dart';

import '../../widgets/navbarUsersSpecials.dart';

class ListaClientes extends StatefulWidget {
  const ListaClientes({Key? key}) : super(key: key);

  @override
  State<ListaClientes> createState() => _ListaClientesState();
}

class _ListaClientesState extends State<ListaClientes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista Clientes'),
        ),
        body: const Center(
          child: Text('Lista Clientes'),
        ),
        bottomNavigationBar: NavBarUsersSpecials());
  }
}
