import 'package:flutter/material.dart';
import 'package:gyzu_cinema/ui/ticket_page.dart';
import 'package:share/share.dart';

import 'home_page.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Image.network(api_imageURL+_movieData["backdrop_path"], width: 200.0, height: 300.0, fit: BoxFit.cover,),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(_movieData["title"],
                  textAlign: TextAlign.center,
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
                    child:
                    Image.asset('assets/images/imgPoltronas.png', width: 300.0, alignment: Alignment.center, fit: BoxFit.cover ,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextButton(
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => HomePage())
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
                        padding: const EdgeInsets.all(20.0),
                        child: TextButton(
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => TicketPage()) //IR PARA TELA DE INGRESSO
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
            ],
          ),
        ),
      ),
    );
  }
}
