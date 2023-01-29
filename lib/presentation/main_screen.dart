import 'package:flutter/material.dart';

import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  final String title;
  const MainScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreen(title: title);
  }
}