import 'package:flutter/material.dart';

import 'package:worney/views/index.dart';

const String homeScreen = 'home';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homeScreen:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    default:
      throw('This route name does not exit');
    }
}