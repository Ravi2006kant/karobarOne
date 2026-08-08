import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:karobarone/components/bottom_icon.dart';

class HomeBottomNavi extends StatelessWidget {
  final int currentIndex;
  final Function(int) tap;
  const HomeBottomNavi({
    super.key,
    required this.currentIndex,
    required this.tap,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      color: Theme.of(context).colorScheme.primary,
      index: currentIndex,
      onTap: tap,
      height: 55,
      animationCurve: Curves.easeInCubic,
      items: [
        BottomIcon(ico: Icons.home),
        BottomIcon(ico: Icons.category_rounded),
        BottomIcon(ico: Icons.inventory_2_outlined),
        BottomIcon(ico: Icons.favorite),
        BottomIcon(ico: Icons.person),
      ],
    );
  }
}
