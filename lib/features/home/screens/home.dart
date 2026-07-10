import 'package:flutter/material.dart';
import 'package:karobarone/components/bottom_drawer.dart';
import 'package:karobarone/components/bottom_icon.dart';
import 'package:karobarone/components/home_bottom_navi.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BottomDrawer(),

      appBar: AppBar(
        title: const Text(
          "KarobarOne",
          style: TextStyle(color: Colors.white, fontWeight: .bold),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          BottomIcon(ico: Icons.notifications),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: BottomIcon(ico: Icons.shopping_cart),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(child: Column(children: [Text("hello")])),
      bottomNavigationBar: HomeBottomNavi(),
    );
  }
}
