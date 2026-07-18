import 'package:flutter/material.dart';

class Themes {
  ThemeData lightmode = ThemeData(
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: Color(0xFF6056EA),
      onPrimary: Color.fromARGB(255, 110, 102, 226),
      onSurface: Colors.white,
      surfaceTint: Colors.black,
    ),
  );
Color purple = Color(0xFF6056EA);
  ThemeData darkmode = ThemeData(
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      primary: Colors.grey.shade900,
      onSurface: Colors.grey.shade700,
      surfaceTint: Colors.white,
      inversePrimary: Color(0xFF6056EA),
    ),
  );
}
