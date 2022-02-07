import 'package:flutter/material.dart';

import 'home_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 100.0, left: 10.0, right: 10.0, bottom: 50.0),
                  child: Text("Faça seu cadastro",
                    style: TextStyle(
                        fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              Padding(padding: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
                child: TextField(
                    decoration: InputDecoration(
                    labelText: "Nome",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: TextStyle(color: Colors.red, fontSize: 18.0),
                  onSubmitted: (text){
                    setState(() {

                    });
                  },
                ),),
              Padding(padding: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: TextStyle(color: Colors.red, fontSize: 18.0),
                  onSubmitted: (text){
                    setState(() {

                    });
                  },
                ),),
              Padding(padding: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Confirmar e-mail",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: TextStyle(color: Colors.red, fontSize: 18.0),
                  onSubmitted: (text){
                    setState(() {

                    });
                  },
                ),),
              Padding(padding: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Senha",
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
              Padding(padding: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Confirmar senha",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LoginPage())
                        );
                      },
                      style: TextButton.styleFrom(
                          elevation: 10,
                          backgroundColor: Colors.white60,
                          fixedSize: const Size(150, 40),
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )
                      ) ,
                      child: const Text(
                        'Voltar',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomePage()
                            )
                        );
                      },
                      style: TextButton.styleFrom(
                          elevation: 10,
                          backgroundColor: Colors.red,
                          fixedSize: const Size(150, 40),
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )
                      ) ,
                      child: const Text(
                        'Avançar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
