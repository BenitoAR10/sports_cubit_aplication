import 'package:flutter/material.dart';

// crear una clase que tenga como atributo un indice para identificar que boton de la navbar se presiono
class IndiceNavBar {
  int indice;
  IndiceNavBar({required this.indice});
  //metodo para obtener el indice
  int getIndice() {
    return indice;
  }

  //metodo para cambiar el indice
  void setIndice(int indice) {
    this.indice = indice;
  }
}

//crear una variable global para poder acceder a la clase desde cualquier parte del codigo
final indiceNavBar = IndiceNavBar(indice: 0);
