import 'package:flutter/material.dart';
import 'package:karobarone/features/bookings/booking_screen.dart';
import 'package:karobarone/features/cart/screens/cart_screen.dart';
import 'package:karobarone/features/home/screens/home.dart';
import 'package:karobarone/features/orders/screens/order_detail_screen.dart';
import 'package:karobarone/features/orders/screens/order_list_screen.dart';
import 'package:karobarone/features/profile/profile_screen.dart';

class Routes extends StatelessWidget {
  const Routes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'home': (context) => Home(),
        'cart': (context) => CartScreen(),
        'booking': (context) => BookingScreen(),
        'orderList': (context) => OrderListScreen(),
        'orderDetail': (context) => OrderDetailScreen(),
        'profile': (context) => ProfileScreen(),
      },
    );
  }
}
