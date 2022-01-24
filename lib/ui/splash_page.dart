import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bkgSplash.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
    );
  }
}

/*MaterialPageRoute(
  builder: (context)=>SelectEvent(context: context,)//Passando para a proxima tela. CONFERIR CODIGO
);*/
