import 'package:flutter/material.dart';

class Theme {
  ThemeData lightmode = ThemeData(
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: Color(0xFF6056EA),
      onPrimary: Color.fromARGB(255, 110, 102, 226),
      onSurface: Colors.white,
    ),
  );

  ThemeData darkmode = ThemeData(
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      primary: Colors.grey.shade800,
      onSurface: Colors.black,
    ),
  );
}
