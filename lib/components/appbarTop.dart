import 'package:flutter/material.dart';

class Appbartop extends StatelessWidget implements PreferredSizeWidget {
  final String titleName;
  const Appbartop({super.key, required this.titleName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        titleName,
        style: TextStyle(color: Colors.white, fontWeight: .bold),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
