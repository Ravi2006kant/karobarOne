import 'package:flutter/material.dart';
import 'package:karobarone/components/home_bottom_navi.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("hello"), bottomNavigationBar: HomeBottomNavi());
  }
}
