import 'package:flutter/material.dart';

class BottomIcon extends StatelessWidget {
  IconData? ico;

  BottomIcon({super.key, required this.ico});

  @override
  Widget build(BuildContext context) {
    return Icon(ico, color: Colors.white);
  }
}
