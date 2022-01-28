
import 'package:flutter/material.dart';
import 'package:gyzu_cinema/ui/qrCodePage.dart';


class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {

  String txtnome = "Spider Man";


  void Salvar(){
    String data;

    setState(() {
      data = txtnome;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => qrCodePage(data: data,)));

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
        title:Image.asset('assets/icons/logoRed.jpg', width: 100, alignment: Alignment.topRight,),

      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Text(
              'Gere seu Qrcode',
              style: TextStyle(
                fontSize: 26,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: Salvar,
                  style: TextButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.red,
                    fixedSize: const Size(300, 50),
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Gerar QRCode',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(width: 32),
              ],),)

        ],
      ),
    );
  }
}
