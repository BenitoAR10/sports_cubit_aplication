import 'package:flutter/material.dart';

import '../../widgets/navbar_users_spacials.dart';

class ListaClientes extends StatefulWidget {
  const ListaClientes({Key? key}) : super(key: key);

  @override
  State<ListaClientes> createState() => _ListaClientesState();
}

class _ListaClientesState extends State<ListaClientes> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_literals_to_create_immutables
    return ListView(children: [
      for (var i = 0; i < 10; i++)
        ListTile(
          title: Text('Cliente $i'),
          subtitle: const Text('Subtitulo'),
          leading: const Icon(Icons.person),
          trailing: const Icon(Icons.arrow_forward_ios),
        )
    ]);
  }
}
