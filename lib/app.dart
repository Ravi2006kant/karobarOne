import 'package:flutter/material.dart';
import 'package:karobarone/config/app_routes.dart';
import 'package:karobarone/core/providers/theme_provider.dart';
import 'package:provider/provider.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      title: 'KarobarOne',
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      theme: themeProvider.themedata,
      
    );
  }
}