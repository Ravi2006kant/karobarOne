import 'package:flutter/material.dart';
import 'package:karobarone/components/listbutton.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Settings"),
      ),
      body: ListButton(),
    );
  }
}
