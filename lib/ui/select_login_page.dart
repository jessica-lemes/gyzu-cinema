import 'package:flutter/material.dart';
import 'package:gyzu_cinema/ui/select_event_page.dart';

import 'home_page.dart';
import 'login_page.dart';

class SelectLoginPage extends StatefulWidget {
  const SelectLoginPage({Key? key}) : super(key: key);

  @override
  _SelectLoginPageState createState() => _SelectLoginPageState();
}

class _SelectLoginPageState extends State<SelectLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bkgSelectLogin.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                child: Image.asset('assets/icons/logoRed.png', width: 300.0, alignment: Alignment.center, fit: BoxFit.cover ,),
              ),
            Padding(
              padding: EdgeInsets.only(left: 50.0),
              child: Image.asset('assets/images/gyzuCinema.png', width: 200.0, alignment: Alignment.topRight, fit: BoxFit.cover,),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 50.0),
              child: Text(
                'BEM-VINDO',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 50.0),
              child: Text(
                'Faça login na Gyzu',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0, left: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage())
                      );
                    },
                    style: TextButton.styleFrom(
                        elevation: 10,
                        backgroundColor: Colors.red,
                        fixedSize: const Size(300, 50),
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )
                    ) ,
                    child: const Text(
                      'Continuar com o Google',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(width: 32),
                ],
              ),),
            Padding(padding: EdgeInsets.only(bottom: 30.0, left: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage())
                      );
                    },
                    style: TextButton.styleFrom(
                      elevation: 10,
                      backgroundColor: Colors.red,
                      fixedSize: const Size(300, 50),
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Continuar com o Facebook',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(width: 32),
                ],),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage())
                );
              },
              child: Text(
                'Entrar com a Gyzu',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
