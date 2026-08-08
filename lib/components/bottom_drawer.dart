import 'package:flutter/material.dart';
import 'package:karobarone/components/bottom_icon.dart';
import 'package:karobarone/components/listbutton.dart';
import 'package:karobarone/features/auth/screens/login_screen.dart';
import 'package:karobarone/features/drawer/about.dart';
import 'package:karobarone/features/drawer/help_support.dart';
import 'package:karobarone/features/setting/setting_screen.dart';

class BottomDrawer extends StatelessWidget {
  BottomDrawer({super.key});
  TextStyle txt = TextStyle(color: Colors.white);
  ButtonStyle btn = ElevatedButton.styleFrom(backgroundColor: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,

      width: 250,
      child: Column(
        mainAxisAlignment: .spaceAround,
        children: [
          CircleAvatar(backgroundColor: Colors.red, radius: 50),

          Text("UserName", style: txt),
          SizedBox(height: 5),
          ListTile(
            leading: BottomIcon(ico: Icons.location_on),
            title: Text('Address', style: txt),
            onTap: () {
              // Handle settings tap
            },
          ),

          ListTile(
            leading: BottomIcon(ico: Icons.settings),
            title: Text('Settings', style: txt),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingScreen()),
              );
            },
          ),

          ListTile(
            leading: BottomIcon(ico: Icons.help_rounded),
            title: Text('Help/Support', style: txt),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpSupport()),
              );
            },
          ),

          ListTile(
            leading: BottomIcon(ico: Icons.info),
            title: Text('About us', style: txt),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => About()),
              );
            },
          ),
         

          ElevatedButton(
            style: btn,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text("Log Out"),
          ),
        ],
      ),
    );
  }
}
