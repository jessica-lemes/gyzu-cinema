import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gyzu_cinema/ui/home_page.dart';
import 'package:gyzu_cinema/ui/qrCodePage.dart';
import 'package:gyzu_cinema/ui/ticket_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:share/share.dart';

class TicketPage extends StatelessWidget {

  final Map _movieData;

  TicketPage(this._movieData); //construtor do gift >como sera exibido

  var api_imageURL = "https://image.tmdb.org/t/p/original/";

  @override
  Widget build(BuildContext context) {


    String txtnome = _movieData["title"];
    String pedido = "18012022";
    String ingresso = "Meia";
    String data = "15/03/2022 - 19h";

    void Salvar() {
      String filme;

        filme = txtnome;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => qrCodePage(filme: filme, pedido: pedido,)));

    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.red,
        ),
        title: Text("Confira seu ingresso!"),
        titleTextStyle:TextStyle (color: Colors.black, fontSize: 20,),
        actions: <Widget>[
          IconButton( //botao na appbar para compartilhar o gif
            icon: Icon(Icons.share),
            onPressed: (){
              //plugin share
              Share.share(_movieData["title"]);
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("Pedido: $pedido",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Image.network(api_imageURL+_movieData["backdrop_path"], height: 200.0,
                  width: 500.0, fit: BoxFit.contain,),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0, 30.0),
                child: Text(_movieData["title"],
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 18.0,),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top:10.0),
                    child: Text("CinemaX",
                      style: TextStyle(color: Colors.black, fontSize: 20.0,),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text("Endereço: Avenida Dante Paz, 400 ",
                      style: TextStyle(color: Colors.black, fontSize: 20.0,),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Text("Data: $data",
                      style: TextStyle(color: Colors.black, fontSize: 20.0,),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 80.0),
                    child: Text("Tipo de Ingesso: $ingresso",
                      style: TextStyle(color: Colors.black, fontSize: 18.0,),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextButton(
                          onPressed: Salvar,
                          style: TextButton.styleFrom(
                            elevation: 10,
                            backgroundColor: Colors.red,
                            fixedSize: const Size(300, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Gerar QRCode',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30.0),
                          child: Text("Ei, mas se tiver algum problema,",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                          ),
                        ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(0),
                          child: Text("clique aqui!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
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
