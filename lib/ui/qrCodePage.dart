import 'package:flutter/material.dart';
import 'package:gyzu_cinema/ui/home_page.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';

class qrCodePage extends StatefulWidget {

  String filme;
  String pedido;
  qrCodePage({ required this.filme, required this.pedido});


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
                fontSize: 20,
              ),
            ),
            QrImage(
              data: widget.pedido,
              gapless: true,
              size: 250,
              errorCorrectionLevel: QrErrorCorrectLevel.H,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Pronto, corre para não perder: ${widget.filme}! "
                "\n Ah não esquece da máscara, que ainda é \n obigatória!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,),
              ),
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
                      Share.share(widget.pedido);
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
                      'Compartilhar',
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
