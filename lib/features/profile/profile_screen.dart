import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(radius: 35, backgroundColor: Colors.amber),
                  SizedBox(width: 15),
                  Text("name"),
                  SizedBox(width: 15),
                  Text("email"),
                ],
              ),

              ListTile(leading: Text("profileEdit")),
              ListTile(leading: Text("my address")),
              ListTile(leading: Text("Payment method")),
              ListTile(leading: Text("profileEdit")), //beocme aseler
              // ListView.separated(
              //   itemBuilder: (context, index) {
              //     return ListTile();
              //   },
              //   separatorBuilder: (build, context) {
              //     return Divider();
              //   },
              //   itemCount: 10,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
