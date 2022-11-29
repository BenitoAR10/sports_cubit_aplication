import 'package:flutter/material.dart';

import '../../widgets/navbar_users_spacials.dart';

class CuentaLE extends StatefulWidget {
  const CuentaLE({Key? key}) : super(key: key);

  @override
  State<CuentaLE> createState() => _CuentaLEState();
}

class _CuentaLEState extends State<CuentaLE> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cuenta'),
        ),
        body: const Center(
          child: Text('Cuenta'),
        ),
        bottomNavigationBar: NavBarUsersSpecials());
  }
}
