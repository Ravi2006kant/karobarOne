import 'package:flutter/material.dart';

class AppbarIcon extends StatelessWidget {
  Function()? tap;
  IconData?ico;
  AppbarIcon({super.key,required this.tap,required this.ico});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: tap,icon: Icon(ico),);
  }
}