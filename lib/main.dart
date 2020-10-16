import 'package:alelo_app_clone/%20constants.dart';
import 'package:alelo_app_clone/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AleloApp());
}

class AleloApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alelo Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Constants.darkGreen,
        scaffoldBackgroundColor: Constants.light,
        appBarTheme: AppBarTheme(
          color: Constants.light,
          brightness: Brightness.light,
          elevation: 0,
        ),
        fontFamily: 'Museosans',
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Constants.darkGreen,
            fontSize: 14,
          ),
          headline4: TextStyle(
            color: Constants.darkGreen,
            fontSize: 18,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
