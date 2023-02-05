import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/activity_bloc/activity_bloc.dart';
import '../data/model/activity_model.dart';

class LoadedActivityScreen extends StatelessWidget {
  const LoadedActivityScreen({Key? key, required this.activity})
      : super(key: key);
  final ActivityModel activity;

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
                  colors: getGradientColors(activity.backgroundType))),
        ),
        Align(
            alignment: FractionalOffset.center,
            child: InkWell(
              onTap: () {
                BlocProvider.of<ActivityBloc>(context).add(LoadActivityEvent());
              },
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Activity type: ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 24.0,
                                  color: getTextColor(activity.backgroundType),
                                  fontWeight: FontWeight.w400)),
                        ),
                        Text(
                          activity.type,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 24.0,
                                  color: getTextColor(activity.backgroundType),
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
                                  color: getTextColor(activity.backgroundType),
                                  fontWeight: FontWeight.w400)),
                        ),
                        Text(
                          activity.participants.toString(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 24.0,
                                  color: getTextColor(activity.backgroundType),
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 14.0)),
                    Image(
                      image: getActivityImage(activity.type),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10.0)),
                    hasLink(hasLinkBool(activity), context),
                    const Padding(padding: EdgeInsets.only(top: 70.0)),
                    Text(
                      "Tap to get a random activity",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 20.0,
                              color: getTextColor(activity.backgroundType),
                              fontWeight: FontWeight.w300)),
                    ),
                  ]),
            ))
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
            // TODO - open link in browser
            const snackBar = SnackBar(
              content: Text('TODO: open link in browser'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: activityBoxWithLink());
    } else {
      return activityBox();
    }
  }

  bool hasLinkBool(ActivityModel activityModel) {
    if (activityModel.link == "") {
      return false;
    }
    return true;
  }

  Widget activityBoxWithLink() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
            height: 185,
            width: 310,
            color: Colors.white,
            alignment: AlignmentDirectional.center,
            child: Stack(children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      activity.activity,
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

  Widget activityBox() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
            height: 185,
            width: 310,
            color: Colors.white,
            alignment: AlignmentDirectional.center,
            child: Stack(children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      activity.activity,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 35.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w400)),
                    )
                  ]),
            ])));
  }
}
