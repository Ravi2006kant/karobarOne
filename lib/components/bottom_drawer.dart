import 'package:flutter/material.dart';
import 'package:karobarone/components/bottom_icon.dart';
import 'package:karobarone/components/listbutton.dart';

class BottomDrawer extends StatelessWidget {
  BottomDrawer({super.key});
  TextStyle txt = TextStyle(color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,

      width: 250,
      child: Column(
        mainAxisAlignment: .spaceAround,
        children: [
          CircleAvatar(radius: 50),

          Text("UserName", style: txt),
          SizedBox(height: 5),
          ListTile(
            leading: BottomIcon(ico: Icons.location_on),
            title: Text('Address', style: txt),
            onTap: () {
              // Handle settings tap
            },
          ),

          SizedBox(height: 5),
          ListTile(
            leading: BottomIcon(ico: Icons.settings),
            title: Text('Settings', style: txt),
            onTap: () {
              // Handle settings tap
            },
          ),

          ListTile(
            leading: BottomIcon(ico: Icons.help_rounded),
            title: Text('Help/Support', style: txt),
            onTap: () {
              // Handle about tap
            },
          ),

          ListTile(
            leading: BottomIcon(ico: Icons.info),
            title: Text('About us', style: txt),
            onTap: () {
              // Handle about tap
            },
          ),
          ListButton(),
          ElevatedButton(onPressed: () {}, child: Text("Log Out")),
        ],
      ),
    );
  }
}
