import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: _pages[_currentPage],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lista Clientes',
            backgroundColor: Colors.amber,
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
}
