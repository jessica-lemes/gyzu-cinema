import 'package:flutter/material.dart';
import 'package:gyzu_cinema/ui/movie_detail.dart';
import 'package:gyzu_cinema/ui/select_event_page.dart';
import 'package:gyzu_cinema/ui/ticket_page.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? _search;

  final _language = "en-US";
  final _region = "BR";

  final _apiUrl = "https://api.themoviedb.org/3/";
  final _key = "?api_key=54c7f6d6359cf02cbe352e75e68189d7";

  final _urlImage = "https://image.tmdb.org/t/p/original";

  //requisição da api
  Future<Map> _getMovies() async {
    http.Response response;

    //tipos de resposta
    if(_search == null || _search!.isEmpty)
      response = await http.get("${_apiUrl}movie/popular${_key}&language=${_language}&page=1");
    else
      response = await http.get("${_apiUrl}search/movie${_key}&language=${_language}&query=${_search}");

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    _getMovies().then((map){
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.red,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: _getMovies,
          ),
        ],
        title:Image.asset('assets/icons/logoRed.jpg', width: 100, alignment: Alignment.topRight,),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Busque seu filme",
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.black, fontSize: 18.0),
              onSubmitted: (text){  //botao pesquisar o texto digitado
                setState(() {
                  _search = text;
                });
              },
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                child: Text(
                  "Em cartaz",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.black, fontSize: 20.0,),
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
                future: _getMovies(),
                builder: (context, snapshot){
                  switch(snapshot.connectionState){
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Container(
                        width: 200.0,
                        height: 200.0,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                          strokeWidth: 5.0,
                        ),
                      );
                    default:
                      if(snapshot.hasError) return Container();
                      else return _createMoviesTable(context, snapshot);
                  }
                }
            ),
          ),
        ],
      ),
    );
  }

  int _getCount(List data){
    if(_search == null){
      return data.length;
    } else {
      return data.length + 1;
    }
  }

//modelo tabela que aparecera
  Widget _createMoviesTable(BuildContext context, AsyncSnapshot snapshot){
    return GridView.builder(//formato grid
        padding: EdgeInsets.all(20.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(//organizacao dos itens
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 5.0,
          childAspectRatio: 0.65,
        ),
        itemCount: _getCount(snapshot.data["results"]),
        itemBuilder: (context, index){ //posicao dos itens
          if(_search == null || index < snapshot.data["results"].length)
            return GestureDetector( //possibilita clicar na imagem
              //suavisar o carregamnto
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: _urlImage+snapshot.data["results"][index]["poster_path"], //caminho do json
                height: 300.0,
                fit: BoxFit.cover,
              ),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MovieDetail(snapshot.data["results"][index]))//dados do filme clicado
                );
              },
            );
          else
            return Container(
              child: GestureDetector(//clicar na imagem
                child: Column(//botao para carregar +
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.arrow_upward, color: Colors.black, size: 30.0,),
                    Text("Voltar para o topo",
                      style: TextStyle(color: Colors.black, fontSize: 20.0),)
                  ],
                ),
                onTap: (){
                  setState(() {
                  });
                },
              ),
            );
/*          else
            return Container(
              child: GestureDetector(//clicar na imagem
                child: Column(//botao para carregar +
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add, color: Colors.black, size: 70.0,),
                    Text("Carregar mais...",
                      style: TextStyle(color: Colors.black, fontSize: 22.0),)
                  ],
                ),
                onTap: (){ //ao clicar no carregar +
                  setState(() {
                    _offset += 19; //carrega mais 19 itens
                  });
                },
              ),
            );*/
        }
    );
  }

}
