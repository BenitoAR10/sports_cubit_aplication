import 'package:flutter/material.dart';

import '../../widgets/navbar_users_spacials.dart';

class ListaPlanes extends StatefulWidget {
  const ListaPlanes({Key? key}) : super(key: key);

  @override
  State<ListaPlanes> createState() => _ListaPlanesState();
}

class _ListaPlanesState extends State<ListaPlanes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista Planes'),
        ),
        body: const Center(
          child: Text('Lista Planes'),
        ),
        bottomNavigationBar: NavBarUsersSpecials());
  }
}
