import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityScreen2 extends StatelessWidget {
  const ActivityScreen2({Key? key}) : super(key: key);

  final int backgroundTypeTest = 2;
  final bool hasLinkBool = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
              color: const Color(0xffffffff),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: getGradientColors(backgroundTypeTest))),
        ),
        Align(
          alignment: FractionalOffset.center,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Activity type: ",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 24.0,
                          color: getTextColor(backgroundTypeTest),
                          fontWeight: FontWeight.w400)),
                ),
                Text(
                  "education",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 24.0,
                          color: getTextColor(backgroundTypeTest),
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 14.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Participants: ",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 24.0,
                          color: getTextColor(backgroundTypeTest),
                          fontWeight: FontWeight.w400)),
                ),
                Text(
                  "1",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 24.0,
                          color: getTextColor(backgroundTypeTest),
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 14.0)),
            Image(
              image: getActivityImage("music"),
            ),
            const Padding(padding: EdgeInsets.only(top: 10.0)),
            hasLink(hasLinkBool, context),
            const Padding(padding: EdgeInsets.only(top: 70.0)),
            Text(
              "Tap to get a random activity",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 20.0,
                      color: getTextColor(backgroundTypeTest),
                      fontWeight: FontWeight.w300)),
            ),
          ]),
        )
      ],
    ));
  }

  List<Color> getGradientColors(int backgroundType) {
    if (backgroundType == 0) {
      return const [Color(0xffD9ED92), Color(0xffB5E48C)];
    } else if (backgroundType == 1) {
      return const [Color(0xff99D98C), Color(0xff76C893)];
    } else {
      return const [Color(0xff168AAD), Color(0xff1A759F)];
    }
  }

  Color getTextColor(int backgroundType) {
    if (backgroundType == 0 || backgroundType == 1) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  AssetImage getActivityImage(String activityType) {
    return AssetImage("assets/images/activity_icons/$activityType.png");
  }

  Widget hasLink(bool hasLink, BuildContext context) {
    if (hasLink) {
      return InkWell(
          onTap: () {
            const snackBar = SnackBar(
              content: Text('TODO: open link in browser'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: activityButton());
    } else {
      return activityButton();
    }
  }

  Widget activityButton() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
            height: 185,
            width: 310,
            color: Colors.white,
            child: Stack(children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Learn how to whistle with your fingers",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 35.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                )
              ]),
              const Positioned(
                bottom: 10,
                right: 10,
                child: Icon(
                  Icons.open_in_browser,
                  color: Colors.black,
                  size: 30,
                ),
              )
            ])));
  }
}
