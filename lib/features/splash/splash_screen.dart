import 'package:flutter/material.dart';
import 'package:karobarone/core/service/auth_service.dart';
import 'package:karobarone/features/auth/screens/login_screen.dart';
import 'package:karobarone/features/home/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async {
    bool loggedIn = await AuthService.instance.isLoggedIn();
    if (!mounted) return;
    if (loggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Text(
              "KarobarOne",
              style: TextStyle(
                color: Color(0xFF6056EA),
                fontWeight: .bold,
                fontSize: 25,
              ),
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
