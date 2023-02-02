import 'package:are_you_bored/presentation/activity_screen_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../data/model/activity_model.dart';
import '../data/repository/activity_repository.dart';
import 'activity_screen.dart';
import 'sliding_up_panel_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
        child: InkWell(
            onTap: () {
              getRandomActivity(context);
            },
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
      ),
      SlidingUpPanel(
          minHeight: 60,
          maxHeight: 300,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          panel: Stack(
              fit: StackFit.expand, children: const [SlidingUpPanelScreen()]))
    ]));
  }

  getRandomActivity(BuildContext context) async {
    ActivityRepository activityRepository = ActivityRepository();
    ActivityModel? activityModel = await activityRepository.getRandomActivity();
    if (activityModel != null){
      moveToNextScreen(context, activityModel);
    }
  }

  moveToNextScreen(BuildContext context, ActivityModel activityModel){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ActivityScreen2(activity: activityModel)));
  }
}
