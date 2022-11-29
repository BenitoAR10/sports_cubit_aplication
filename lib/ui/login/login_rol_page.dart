// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sports_cubit_aplication/cubit/cubit.dart';

// class RolPage extends StatelessWidget {
//   const RolPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

//   }
// }

// class SelectionRol extends StatelessWidget {
//   const SelectionRol({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final loginCubit = BlocProvider.of<LoginCubit>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Seleccionar Usuario'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () => Navigator.pop(context),
//           )
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () => loginCubit.selectRol('admin'),
//               child: const Text('Administrador'),
//             ),
//             ElevatedButton(
//               onPressed: () => loginCubit.selectRol('user'),
//               child: const Text('Usuario'),
//             ),
//           ],
//         ),
//       ),
//     );
    
//   }
// }