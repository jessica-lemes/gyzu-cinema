import 'package:flutter/material.dart';
import 'package:gyzu_cinema/ui/movie_detail.dart';
import 'package:gyzu_cinema/ui/select_event_page.dart';
import 'package:gyzu_cinema/ui/ticket_page.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
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

  int _offset = 0;

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
                  labelText: "Escolha um filme",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder()
              ),
              style: TextStyle(color: Colors.black, fontSize: 18.0),
              textAlign: TextAlign.center,
              onSubmitted: (text){  //botao pesquisar o texto digitado
                setState(() {
                  _search = text;
                  _offset = 0;//nova pesquisa resseta o offset
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Em cartaz",
              style: TextStyle(color: Colors.black, fontSize: 18.0),
            ),
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

/*  int _getCount(List data){
    if(_search == null){
      return data.length;
    } else {
      return data.length + 1;
    }
  }*/

//modelo tabela que aparecera
  Widget _createMoviesTable(BuildContext context, AsyncSnapshot snapshot){
    return GridView.builder(//formato grid
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(//organizacao dos itens
          crossAxisCount: 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.65,
        ),
        //itemCount: _getCount(snapshot.data["data"]),
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
                    MaterialPageRoute(builder: (context) => MovieDetail(snapshot.data["results"][index]))//dados do gif clicado
                );
              },
/*              onLongPress: (){
                //plugin share
                Share.share(snapshot.data["results"][index]["poster_path"]);
              },*/
            );
          else
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
            );
        }
    );
  }

}
