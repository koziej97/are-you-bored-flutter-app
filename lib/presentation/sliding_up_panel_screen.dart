import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> list = <String>['Any', '1', '2', '3', 'More than 3'];

class SlidingUpPanelScreen extends StatefulWidget {
  const SlidingUpPanelScreen({super.key});

  @override
  State<SlidingUpPanelScreen> createState() => _SlidingUpPanelScreenState();
}

class _SlidingUpPanelScreenState extends State<SlidingUpPanelScreen> {
  int? _value = -1;
  List<String> activityTypes = ActivityTypes.values.map((e) => e.name).toList();

  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "How many participants:",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 20.0)),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      borderRadius: BorderRadius.circular(10.0),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Text(
                  'Choose type:',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 10.0),
                Wrap(
                  spacing: 5.0,
                  children: List<Widget>.generate(
                    9,
                    (int index) {
                      return ChoiceChip(
                        label: Text(activityTypes[index]),
                        selected: _value == index,
                        onSelected: (bool selected) {
                          setState(() {
                            _value = selected ? index : null;
                          });
                        },
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          )
        ]));
  }
}

enum ActivityTypes {
  education,
  recreational,
  social,
  diy,
  charity,
  cooking,
  relaxation,
  music,
  busywork
}
