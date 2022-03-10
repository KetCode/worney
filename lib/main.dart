import 'package:flutter/material.dart';
import 'route/route.dart' as route;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Worney',
      // debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        primaryColor: const Color(0xFFFF941A),
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 52.0, fontWeight: FontWeight.w600, fontFamily: 'Lexend'),
          bodyText1: TextStyle(fontSize: 14.0, fontFamily: 'Hint'),
          bodyText2: TextStyle(fontSize: 24.0, fontFamily: 'Inter')
        ),
      ),
      onGenerateRoute: route.controller,
      initialRoute: route.homeScreen,
    );
  }
}
