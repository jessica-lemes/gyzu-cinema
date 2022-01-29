import 'package:flutter/material.dart';
import 'package:share/share.dart';


class MovieDetail extends StatelessWidget {

  final Map _gifData;

  MovieDetail(this._gifData); //construtor do gift >como sera exibido

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.red,
        ),
        title: Text(_gifData["title"]),
        titleTextStyle:TextStyle (color: Colors.red, fontSize: 20,),
        actions: <Widget>[
          IconButton( //botao na appbar para compartilhar o gif
            icon: Icon(Icons.share),
            onPressed: (){
              //plugin share
              Share.share(_gifData["title"]);
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network(_gifData["poster_path"], width: 300.0,),
      ),
    );
  }
}
