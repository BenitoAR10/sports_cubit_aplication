import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_cubit_aplication/login/cubit/login_cubit.dart';
import 'package:sports_cubit_aplication/login/cubit/login_state.dart';

import '../../status/page_status.dart';


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
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (ctx3, state){
            if(state.status == PageStatus.loading){
              _showDialog(context, "Autenticacion",
              "Verificando sus credenciales", false);
            } else if (state.status == PageStatus.success && state.loginSuccess){
              // Si el cibut nos dice que el login fue exitoso
              // Se va a la pagina de inicio
              Navigator.pop(ctx3);
              Navigator.pushNamed(ctx3, "/home");
            }else {
              // Si el cubit nos dice que el login fue fallido
              Navigator.pop(ctx3); // cerramos el dialogo
              _showDialog(context, "Error", state.errorMessage!, true);
            }
          },
          // Construimos la pantalla
          builder: (context, state) => Center(child: formLogin(context)),
        )
      ),     
    );
  }

  Widget userInput (TextEditingController userInput, String hintTitle, TextInputType keyboardType){
    return Container(
      height: 55,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(color:  Colors.green.shade200, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 15, right: 25),
        child: TextField(
          controller: userInput,
          autocorrect: false,
          enableSuggestions: false,
          autofocus: false,
          decoration: InputDecoration.collapsed(
            hintText: hintTitle,
            hintStyle: const TextStyle(fontSize: 18, color: Colors.white70, fontStyle: FontStyle.normal),
          ),
          keyboardType: keyboardType,
        ),
      )
    );
  }
  Widget passwordInput (TextEditingController passwordInput, String hintTitle, TextInputType keyboardType){
    return Container(
      height: 55,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(color:  Colors.green.shade200, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 15, right: 25),
        child: TextField(
          //obscureText: _isObscure,
          controller: passwordInput,
          autocorrect: false,
          enableSuggestions: false,
          autofocus: false,
          decoration: InputDecoration.collapsed(
            hintText: hintTitle,
            hintStyle: const TextStyle(fontSize: 18, color: Colors.white70, fontStyle: FontStyle.normal),
          ),
          keyboardType: keyboardType,
        ),
      )
    );
  }

  Widget formLogin(BuildContext context){

    return Scaffold(
      body: Container(
        /*
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            fit: BoxFit.fill,
            image: NetworkImage(
              'https://www.teahub.io/photos/full/246-2460189_full-hd-background-abstract-portrait.jpg',
            ),
          ),
        ),*/
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                    userInput(_correoController, 'Correo', TextInputType.emailAddress),
                    userInput(_contraseniaController, 'Contraseña', TextInputType.visiblePassword),
                    Container(
                      height: 55,
                        padding: const EdgeInsets.only(top: 5, left: 70, right: 70),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        color: Colors.green,
                        onPressed: () {
                          print(_correoController);
                          print(_contraseniaController);
                          BlocProvider.of<LoginCubit>(context).login(_correoController.text, _contraseniaController.text);                          
                        },
                        child: Text('Ingresar', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white,),),
                        ),
                      ),
                    Container(
                      height: 55,
                        padding: const EdgeInsets.only(top: 5, left: 70, right: 70),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        color: Colors.white70,
                        onPressed: () {
                          Navigator.pop(context, "/");                          
                        },
                        child: Text('Cancelar', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.green,),),
                        ),
                      ),
                    const SizedBox(height: 20),
                    const Center(child: Text('Forgot password ?'),),
                    const SizedBox(height: 20),
                    const Divider(thickness: 0, color: Colors.white),
                  ],
                ),
              ),
            )
          ],
                //   const Text("Login"),
                //   TextField(
                //     controller: _correoController,
                //     decoration: const InputDecoration(
                //       hintText: "Username",
                //     ),
                //   ),
                //   TextField(
                //     controller: _contraseniaController,
                //     decoration: const InputDecoration(
                //       hintText: "Password",
                //     ),
                //   ),
                //   ElevatedButton(
                //       // Los eventos desde UI, se lo envial al CUTBIT
                //       onPressed: () {
                //         BlocProvider.of<LoginCubit>(context)
                //             .login(_correoController.text, _contraseniaController.text);
                //       },
                //       child: const Text("Login")),
                //   ElevatedButton(
                //       onPressed: () {
                //         Navigator.pushNamed(context, '/register');
                //       },
                //       child: const Text("Create account"))
                // ],
        ),
      ),
    
    );
  }

  Future<void> _showDialog(BuildContext context, String title, String message,
      bool closeable) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            closeable
                ? TextButton(
                    child: const Text('Cerrar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                : Container(),
          ],
        );
      },
    );
  }
}
