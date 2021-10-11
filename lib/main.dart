import 'package:flutter/material.dart';
import 'package:homebank/ui/bottomNavigation.dart';
import 'package:homebank/ui/intro/intro.screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomeBank User',
      // theme: kThemeData,
      home: IntroScreen(),
    );
  }
}
