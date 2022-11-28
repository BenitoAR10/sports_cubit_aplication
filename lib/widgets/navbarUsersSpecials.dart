import 'package:flutter/material.dart';

// crear una barra de navegacion con un boton que diga lista clientes, otro que diga planes y uno ultimo que diga cuenta
class NavBarUsersSpecials extends StatelessWidget {
  const NavBarUsersSpecials({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Lista Clientes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.money),
          label: 'Planes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Cuenta',
        ),
      ],
      currentIndex: 0,
      selectedItemColor: Colors.amber[800],
    );
  }
}
