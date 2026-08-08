import 'package:flutter/material.dart';
import 'package:karobarone/features/home/screens/home_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String wishlist = '/';
  static const String order = '/';

  static Map<String, WidgetBuilder> routes = {
    home: (context) =>  HomeScreen(),
  };
}
