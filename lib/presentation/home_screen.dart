import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

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
            CircleAvatar(
                radius: 126.0,
                backgroundColor: Colors.white,
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text(
                        "Are you",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 40.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                      ),
                      Text(
                        "bored?",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 64.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                      ),
                    ]))),
            const Padding(padding: EdgeInsets.only(top: 61.0)),
            Text(
              "Tap to get a random activity",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300)),
            ),
          ])),
      SlidingUpPanel(
          minHeight: 60,
          maxHeight: 300,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          panel: Stack(fit: StackFit.expand, children: [
            Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 15.0)),
                      Text(
                        "Swipe up to specify activity type",
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 15.0,
                                height: 1.2,
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(
                              top: 10.0, left: 100.0, right: 100.0, bottom: 10.0),
                          child: Divider(
                            height: 10,
                            color: Colors.black,
                            thickness: 1,
                          )),
                    ]))
          ]))
    ]));
  }
}
