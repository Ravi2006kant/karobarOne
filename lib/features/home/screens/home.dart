import 'package:flutter/material.dart';
import 'package:karobarone/components/appbar_icon.dart';
import 'package:karobarone/components/bottom_drawer.dart';
import 'package:karobarone/components/bottom_icon.dart';
import 'package:karobarone/components/home_bottom_navi.dart';
import 'package:karobarone/components/listbutton.dart';
import 'package:karobarone/core/providers/theme_provider.dart';
import 'package:karobarone/features/address/address_screen.dart';
import 'package:karobarone/features/cart/screens/cart_screen.dart';
import 'package:karobarone/features/category/category_screen.dart';
import 'package:karobarone/features/home/screens/home_screen.dart';
import 'package:karobarone/features/notification/notification_screen.dart';
import 'package:karobarone/features/orders/screens/order_list_screen.dart';
import 'package:karobarone/features/products/screens/product_list_screen.dart';
import 'package:karobarone/features/profile/profile_screen.dart';
import 'package:karobarone/features/profile/sample_profile.dart';
import 'package:karobarone/features/search/screens/search_screen.dart';
import 'package:karobarone/features/wishlist/screens/wishlist_screen.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedindex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    CategoryScreen(),
    OrderListScreen(),
    WishlistScreen(),
    SampleProfile(),
  ];

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
          AppbarIcon(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddressScreen()),
              );
            },
            ico: Icons.notifications,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: AppbarIcon(
              tap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
                // navigatorpsnames approutes.cart
              },
              ico: Icons.shopping_cart,
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      body: SafeArea(child: _pages[_selectedindex]),
      bottomNavigationBar: HomeBottomNavi(
        currentIndex: _selectedindex,
        tap: (value) {
          setState(() {
            _selectedindex = value;
          });
        },
      ),
    );
  }
}
