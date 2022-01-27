import 'package:flutter/material.dart';
import 'package:gyzu_cinema/ui/select_event_page.dart';
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

  int _offset = 0;

  //requisição da api
  Future<Map> _getGifs() async {
    http.Response response;

    //tipos de resposta
    if(_search == null || _search!.isEmpty)
      response = await http.get("https://api.giphy.com/v1/gifs/search?api_key=zswb6bZl4awKgJiFsoJR6rkMitjAPNUW&q=movie&limit=25&offset=0&rating=g&lang=en");
    else                                                                                                          //pesquisa             //valor de offset
      response = await http.get("https://api.giphy.com/v1/gifs/search?api_key=wusbFwUExpkztfjeMr3QRimPUc4kd1J9&q=$_search&limit=19&offset=$_offset&rating=G&lang=en");

    return json.decode(response.body);//conserve os dados em json
  }


  @override
  void initState() {
    super.initState();

    _getGifs().then((map){
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.red,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: _getGifs,
          ),
        ],
        title:Image.asset('icons/logoRed.jpg', width: 100, alignment: Alignment.topRight,),
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
          Expanded(
            child: FutureBuilder(
                future: _getGifs(),
                builder: (context, snapshot){
                  switch(snapshot.connectionState){
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Container(
                        width: 200.0,
                        height: 200.0,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          strokeWidth: 5.0,
                        ),
                      );
                    default:
                      if(snapshot.hasError) return Container();
                      else return _createGifTable(context, snapshot);
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
  Widget _createGifTable(BuildContext context, AsyncSnapshot snapshot){
    return GridView.builder(//formato grid
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(//organizacao dos itens
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0
        ),
        itemCount: _getCount(snapshot.data["data"]),
        itemBuilder: (context, index){ //posicao dos itens
          if(_search == null || index < snapshot.data["data"].length)
            return GestureDetector( //possibilita clicar na imagem
              //suavisar o carregamnto
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: snapshot.data["data"][index]["images"]["fixed_height"]["url"], //caminho do json
                height: 300.0,
                fit: BoxFit.cover,
              ),
              onTap: (){
                // on tap > ao clicar no gif direciona para  a pag de dealhes
                /*Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GifPage(snapshot.data["data"][index]))//dados do gif clicado
                );*/
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SelectEvent())//dados do gif clicado
                );
              },
              onLongPress: (){
                //plugin share
                Share.share(snapshot.data["data"][index]["images"]["fixed_height"]["url"]);
              },
            );
          else
            return Container(
              child: GestureDetector(//clicar na imagem
                child: Column(//botao para carregar +
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add, color: Colors.white, size: 70.0,),
                    Text("Carregar mais...",
                      style: TextStyle(color: Colors.white, fontSize: 22.0),)
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
