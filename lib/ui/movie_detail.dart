import 'package:flutter/material.dart';
import 'package:share/share.dart';

class MovieDetail extends StatelessWidget {

  final Map _movieData;

  MovieDetail(this._movieData); //construtor do gift >como sera exibido

  var api_imageURL = "https://image.tmdb.org/t/p/original/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.red,
        ),
        title: Text(_movieData["title"]),
        titleTextStyle:TextStyle (color: Colors.red, fontSize: 20,),
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
      body: Card(
        child: Center(
          child: Column(
/*          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,*/
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Image.network(api_imageURL+_movieData["backdrop_path"], width: 200.0, height: 300.0, fit: BoxFit.cover,),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(_movieData["title"],
                  style: TextStyle(color: Colors.black, fontSize: 30.0,),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Horários:",
                      style: TextStyle(color: Colors.black, fontSize: 20.0,),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("CHECKBOX DE HORARIOS AQUI",
                      style: TextStyle(color: Colors.black, fontSize: 20.0,),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Selecione sua poltrona:",
                      style: TextStyle(color: Colors.black, fontSize: 20.0,),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child:
                    Image.asset('assets/images/imgPoltronas.png', width: 300.0, alignment: Alignment.center, fit: BoxFit.cover ,),
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
