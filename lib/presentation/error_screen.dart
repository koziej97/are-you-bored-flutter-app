import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: [
      Container(
        decoration: const BoxDecoration(
            color: Color(0xffffffff),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xff52B69A), Color(0xff34A0A4)])),
      ),
      Align(
          alignment: FractionalOffset.center,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Image(
              image: AssetImage("assets/images/error_sad_emoji.png"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "An error occurred while loading your request. Please check your internet connection or try again later.",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w400)),
              ),
            )
          ]))
    ]));
  }
}
