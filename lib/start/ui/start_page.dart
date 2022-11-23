import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  static Route<void> route(){
    return MaterialPageRoute<void>(builder: (_) => const StartPage());
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          /*
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('img/sportsApp.jpg'),
                fit: BoxFit.cover,
                ),
              )
            ),*/
            Column(
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60, left: 25),
                    child: Column(
                      children: [
                        Text('SportsApp', style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold, color: Colors.green),),
                      ],
                    ), 
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
                        child: RaisedButton(
                          onPressed: () => Navigator.of(context).pushNamed('/register'),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            ),
                          color: Colors.green,
                          child: const Text(
                            'Crear cuenta', 
                            style: TextStyle(
                              fontSize: 20, 
                              fontWeight: FontWeight.w700, 
                              color: Colors.white),
                            ),
                          ),
                        ),  
                       Container(
                        height: 80,
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
                        child: RaisedButton(
                          onPressed: () => Navigator.of(context).pushNamed('/login'),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            ),
                          color: Colors.white70,
                          child: const Text(
                            'Iniciar sesión', 
                            style: TextStyle(
                              fontSize: 20, 
                              fontWeight: FontWeight.w700, 
                              color: Colors.green),
                            ),
                          ),
                        ),                    
                    ]),
                ),
              ],
            )         
        ],
      )
    );
  }
  
}

