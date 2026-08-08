import 'package:flutter/material.dart';
import 'package:karobarone/components/profile_textfield.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  TextEditingController mobilecont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white, fontWeight: .bold),
        ),
      ),
      body: Column(
        children: [ProfileTextfield(cont: mobilecont, type: .datetime)],
      ),
    );
  }
}
