import 'package:flutter/material.dart';
import 'package:karobarone/features/auth/screens/login_screen.dart';
import 'package:karobarone/features/auth/screens/otp_screen.dart';
import 'package:karobarone/features/auth/screens/register_screen.dart';
import 'package:karobarone/features/cart/screens/cart_screen.dart';
import 'package:karobarone/features/home/screens/home.dart';
import 'package:karobarone/features/home/screens/home_screen.dart';
import 'package:karobarone/features/splash/splash_screen.dart';
import 'package:karobarone/seller/tenant/new_tenent/create_tenent.dart';

class AppRoutes {
  static const String home = '/';
  // static const String homeScreen = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String otp = '/otp';
  static const String cart = '/cart';
  static const String wishlist = '/wishlist';
  static const String order = '/order';
  static const String splash = '/splash';
  static const String tenent = '/tenent';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const Home(),
    // homeScreen : (context) =>  HomeScreen(),
    cart: (context) => const CartScreen(),
    login: (context) => LoginScreen(),
    register: (context) => RegisterScreen(),
    tenent: (context) => CreateTenantScreen(),
    splash: (context) => const SplashScreen(),
    // otp: (context) => OtpScreen(),
  };

  // static Route<dynamic> onGenerateRoute(RouteSettings setting) {
  //   switch (setting.name) {
  //     case otp:
  //       final otp = setting.arguments;
  //       // return MaterialPageRoute(builder: (_) => OtpScreen());
  //     default:
  //       return MaterialPageRoute(builder: (_) => HomeScreen());
  //   }
  // }
}
