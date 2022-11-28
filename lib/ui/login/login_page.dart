import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_cubit_aplication/cubit/login/login_cubit.dart';
import 'package:sports_cubit_aplication/cubit/login/login_state.dart';
import 'package:sports_cubit_aplication/widgets/show_dialog.dart';

import '../../cubit/login/login_cubit.dart';
import '../../status/page_status.dart';
import '../../widgets/image_container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _correoController = TextEditingController();
  final _contraseniaController = TextEditingController();

  @override
  Widget build(BuildContext ctx1) {
    // BlocProvider es un widget que nos permite acceder a un cubit
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text("Login"),
          ),
          body: BlocConsumer<LoginCubit, LoginState>(
            // Escucho los evetos que llegan del cubit
            listener: (ctx3, state) {
              // Si el cubir dice cargando, se muestra un dialog que dice cargando
              if (state.status == PageStatus.loading) {
                ShowDialog(context, "Autenticacion",
                    "Verificando sus credenciales", false);
              } else if (state.status == PageStatus.success &&
                  state.loginSuccess) {
                // Si el cibut nos dice que el login fue exitoso
                // Se va a la pagina de inicio
                Navigator.pop(ctx3);
                Navigator.pushNamed(ctx3, "/home");
              } else {
                // Si el cubit nos dice que el login fue fallido se muestra un dialog.
                Navigator.pop(ctx3); // cerramos el dialogo
                ShowDialog(context, "Error", state.errorMessage!, true);
              }
            },
            // Construimos la pantalla
            builder: (context, state) => Center(child: formLogin(context)),
          )),
    );
  }

  Widget userInput(TextEditingController userInput, String hintTitle,
      TextInputType keyboardType) {
    return Container(
        height: 55,
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            color: Colors.green.shade200,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 15, right: 25),
          child: TextField(
            controller: userInput,
            autocorrect: false,
            enableSuggestions: false,
            autofocus: false,
            decoration: InputDecoration.collapsed(
              hintText: hintTitle,
              hintStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  fontStyle: FontStyle.normal),
            ),
            keyboardType: keyboardType,
          ),
        ));
  }

  bool _isObscure = true;

  Widget passwordInput(TextEditingController passwordInput, String hintTitle,
      TextInputType keyboardType) {
    return Container(
        height: 55,
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            color: Colors.green.shade200,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 15, right: 25),
          child: TextField(
            obscureText: _isObscure,
            controller: passwordInput,
            autocorrect: false,
            enableSuggestions: false,
            autofocus: false,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon:
                    Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              ),
              hintText: hintTitle,
              hintStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  fontStyle: FontStyle.normal),
            ),
            keyboardType: keyboardType,
          ),
        ));
  }

  Widget formLogin(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        const Image(
                            image: AssetImage('assets/sportsApp.jpg'),
                            height: 200),
                      ],
                    ),
                  ),
                  Container(
                    height: 510,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: 45),
                          userInput(_correoController, 'Correo',
                              TextInputType.emailAddress),
                          passwordInput(_contraseniaController, 'Contraseña',
                              TextInputType.visiblePassword),
                          Container(
                            height: 55,
                            padding: const EdgeInsets.only(
                                top: 5, left: 70, right: 70),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green.shade400,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              // Los eventos desde la vista se envian al cubit
                              onPressed: () {
                                print(_correoController);
                                print(_contraseniaController);
                                BlocProvider.of<LoginCubit>(context).login(
                                    _correoController.text,
                                    _contraseniaController.text);
                              },
                              child: Text(
                                'Ingresar',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 55,
                            padding: const EdgeInsets.only(
                                top: 5, left: 70, right: 70),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              onPressed: () {
                                Navigator.pop(context, "/");
                              },
                              child: Text(
                                'Cancelar',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Center(
                            child: Text('Forgot password ?'),
                          ),
                          const SizedBox(height: 20),
                          const Divider(thickness: 0, color: Colors.white),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
