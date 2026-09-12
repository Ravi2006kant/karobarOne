import 'package:flutter/material.dart';

class Defaulttext extends StatelessWidget {
  final String titleName;
  const Defaulttext({super.key, required this.titleName});

  @override
  Widget build(BuildContext context) {
    return Text(titleName, style: TextStyle(color: Colors.white));
  }
}
