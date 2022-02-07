import 'package:flutter/material.dart';
import 'package:gyzu_cinema/ui/register_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 250.0, left: 10.0, right: 10.0, bottom: 50.0),
              child: Text("Faça login na Gyzu",
                style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold
              ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

              ),
              style: TextStyle(color: Colors.black, fontSize: 18.0),
              onSubmitted: (text){
                setState(() {

                });
              },
            ),),
          Padding(padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Senha",
                suffixIcon: Icon(
                  Icons.visibility_off_outlined,
                  color: Colors.black,
                ),
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              style: TextStyle(color: Colors.black, fontSize: 18.0),
              onSubmitted: (text){
                setState(() {

                });
              },
            ),),
          Padding(
              padding: EdgeInsets.all(10.0),
              child: TextButton(
                child: Text("Esqueci minha senha",
                style: TextStyle(color: Colors.red, fontSize: 14.0),),
                onPressed: () {  }, ),
          ),
          TextButton(
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePage())
              );
            },
            style: TextButton.styleFrom(
                elevation: 10,
                backgroundColor: Colors.red,
                fixedSize: const Size(300, 40),
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )
            ) ,
            child: const Text(
              'ENTRE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text("Não tem uma conta?",
                style: TextStyle(
                    fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold
                ),
            ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: TextButton(
                 child: Text("Cadastre-se",
                   style: TextStyle(color: Colors.red, fontSize: 16.0),),
                 onPressed: () {
                   Navigator.push(context,
                       MaterialPageRoute(builder: (context) => RegisterPage())
                   );
                 }, ),
             ),
            ],
          )
        ],
      ),
    );
  }
}
