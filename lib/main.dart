import 'package:flutter/material.dart';
import 'package:karobarone/core/providers/theme_provider.dart';
import 'package:karobarone/features/auth/screens/login_screen.dart';
import 'package:karobarone/features/home/screens/home.dart';
import 'package:karobarone/config/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => ThemeProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      title: 'KarobarOne',
      debugShowCheckedModeBanner: false,
      theme: themeProvider.themedata,

      home: Home(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
