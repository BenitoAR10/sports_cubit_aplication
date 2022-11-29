import 'package:flutter/material.dart';
import 'package:sports_cubit_aplication/widgets/indiceNavBar.dart';

class NavBarUsersSpecials extends StatefulWidget {
  const NavBarUsersSpecials({Key? key}) : super(key: key);

  @override
  State<NavBarUsersSpecials> createState() => _NavBarUsersSpecialsState();
}

class _NavBarUsersSpecialsState extends State<NavBarUsersSpecials> {
  int _selectedIndex = indiceNavBar.getIndice();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      switch (index) {
        case 0:
          indiceNavBar.setIndice(0);
          Navigator.of(context).pushReplacementNamed('/listaClientesLE');
          break;
        case 1:
          indiceNavBar.setIndice(1);
          Navigator.of(context).popAndPushNamed('/listaPlanesLE');

          break;
        case 2:
          indiceNavBar.setIndice(2);
          Navigator.of(context).popAndPushNamed('/cuentaLE');

          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Lista Clientes',
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.money),
          label: 'Planes',
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box_rounded),
          label: 'Cuenta',
          backgroundColor: Colors.green,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.green,
      onTap: (value) => _onItemTapped(value),
    );
  }
}
