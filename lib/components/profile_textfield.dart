import 'package:flutter/material.dart';

class ProfileTextfield extends StatelessWidget {
  TextEditingController cont;
  TextInputType type;
  ProfileTextfield({super.key, required this.cont, required this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextField(
        controller: cont,

        obscureText: false,
        keyboardType: type,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
