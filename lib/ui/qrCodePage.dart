import 'package:flutter/material.dart';
import 'package:gyzu_cinema/ui/home_page.dart';
import 'package:qr_flutter/qr_flutter.dart';

class qrCodePage extends StatefulWidget {

  String data;
  qrCodePage({required this.data});


  @override
  _State createState() => _State();
}

class _State extends State<qrCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("QRCode",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Aproxime do toten!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
              ),
            ),

            SizedBox(height: 16,),
            QrImage(
              data: widget.data,
              gapless: true,
              size: 250,
              errorCorrectionLevel: QrErrorCorrectLevel.H,
            ),
            Text("Pronto, corre para não perder ${widget.data}! "
                "\n Ah não esquece da máscara, que ainda é \n obigatória!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(90.0, 20.0,90.0, 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                      onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage())//dados do gif clicado
                      );
                      },
                    style: TextButton.styleFrom(
                      elevation: 10,
                      backgroundColor: Colors.white60,
                      fixedSize: const Size(150,40),
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Voltar',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                      TextButton(
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => HomePage())//dados do gif clicado
                          );
                        },
                        style: TextButton.styleFrom(
                          elevation: 10,
                          backgroundColor: Colors.red,
                          fixedSize: const Size(150, 40),
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Salvar em PDF',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
     ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
class qrCodePage extends StatelessWidget {
  const qrCodePage(Type data, {Key? key}) : super(key: key);

  String data;

  QrCode(this.data);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Código QR"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Código gerado com o texto:\n $data",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16,),

            QrImage(
              data: data,
              gapless: true,
              size: 250,
              errorCorrectionLevel: QrErrorCorrectLevel.H,
            )
          ],
        ),
      ),
    );
  }
}*/
