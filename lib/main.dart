import 'package:flutter/material.dart';
import 'package:gyzu_cinema/ui/home_page.dart';
import 'package:gyzu_cinema/ui/movie_detail.dart';
import 'package:gyzu_cinema/ui/qrCodePage.dart';
import 'package:gyzu_cinema/ui/splash_page.dart';
import 'package:gyzu_cinema/ui/ticket_page.dart';
import 'package:gyzu_cinema/ui/ticket_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gyzu Cinema",
      theme: ThemeData(
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.red,
          iconTheme: IconThemeData(
            color: Colors.red,
          ),
          buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          )
      ),
      home:SplashPage(),
    );
  }
}
