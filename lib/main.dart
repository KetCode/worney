import 'package:flutter/material.dart';
import 'route/route.dart' as route;

void main() {
  runApp(MyApp());
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
        primarySwatch: Colors.deepPurple,
      ),
      onGenerateRoute: route.controller,
      initialRoute: route.homeScreen,
    );
  }
}
