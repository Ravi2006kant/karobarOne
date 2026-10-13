import 'package:flutter/material.dart';

class TenentTextfield extends StatelessWidget {
  TenentTextfield({
    super.key,
    required this.text,
    required this.cont,
    required this.type,
  });
  String text;
  TextInputType type;
  TextEditingController cont;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            text,
            style: TextStyle(color: Colors.black, fontWeight: .bold),
          ),
          TextField(
            keyboardType: type,
            style: TextStyle(color: Colors.black),
            controller: cont,
            decoration: InputDecoration(
              // hintText: "Enter password",
              hintStyle: TextStyle(color: Colors.black),
              fillColor: Colors.black,
              focusColor: Colors.black,

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
