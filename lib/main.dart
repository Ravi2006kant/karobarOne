import 'package:flutter/material.dart';
import 'package:karobarone/app.dart';
import 'package:karobarone/core/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => ThemeProvider(), child: MyApp()),
  );
}
