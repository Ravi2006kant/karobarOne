import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karobarone/core/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ListButton extends StatelessWidget {
  const ListButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.dark_mode_rounded, color: Colors.white),
      title: Text("Dark Mode", style: TextStyle(color: Colors.white)),

      trailing: CupertinoSwitch(
        activeTrackColor: Theme.of(context).colorScheme.inversePrimary,
        inactiveTrackColor: Colors.purple.shade300,
        value: context.read<ThemeProvider>().isDark,
        onChanged: (value) {
          context.read<ThemeProvider>().toggle();
        },
      ),
    );
  }
}
