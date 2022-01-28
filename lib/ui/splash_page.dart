import 'package:flutter/material.dart';
import 'package:gyzu_cinema/ui/select_event_page.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 5,
          gradientBackground: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xffED213A),
              Color(0xff93291E)
            ],
          ),
          navigateAfterSeconds: SelectEvent(),
          loaderColor: Colors.transparent,
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/icons/logoWhite.png"),
              fit: BoxFit.none,
            ),
          ),
        ),
      ],
    );
  }
}
