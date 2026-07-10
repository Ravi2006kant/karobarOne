import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:karobarone/components/bottom_icon.dart';

class HomeBottomNavi extends StatefulWidget {
  const HomeBottomNavi({super.key});

  @override
  State<HomeBottomNavi> createState() => _HomeBottomNaviState();
}

class _HomeBottomNaviState extends State<HomeBottomNavi> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.white,
      color: Theme.of(context).colorScheme.primary,
      onTap: (index) {},
      items: [
        BottomIcon(ico: Icons.home),
        BottomIcon(ico: Icons.search),
        BottomIcon(ico: Icons.inventory_2_outlined),
        BottomIcon(ico: Icons.favorite),
        BottomIcon(ico: Icons.person),
      ],
    );
  }
}
