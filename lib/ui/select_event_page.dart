import 'package:flutter/material.dart';
import 'package:gyzu_cinema/ui/home_page.dart';

class SelectEvent extends StatefulWidget {
  const SelectEvent({Key? key}) : super(key: key);

  @override
  _SelectEventState createState() => _SelectEventState();
}

class _SelectEventState extends State<SelectEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bkgSelectEvent.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 100.0, bottom: 100.0),
              child: Text(
              'BEM-VINDO',
              style: TextStyle(
                fontSize: 26,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0, left: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: (){},
                  style: TextButton.styleFrom(
                      elevation: 10,
                      backgroundColor: Colors.red,
                      fixedSize: const Size(300, 50),
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )
                  ) ,
                  child: const Text(
                    'EVENTOS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(width: 32),
              ],
            ),),
            Padding(padding: EdgeInsets.only(bottom: 30.0, left: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage())//dados do gif clicado
                    );
                   /* MaterialPageRoute(
                        builder: (context)=>HomePage()//Passando para a proxima tela
                    );
                    Navigator.pop(context);*/
                  },
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
                    'CINEMA',
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
      ),
    );
  }
}
