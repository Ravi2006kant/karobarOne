import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Notification", style: TextStyle(fontWeight: .bold)),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(leading: Text("helo"));
        },
      ),
    );
  }
}
