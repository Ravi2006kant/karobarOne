import 'package:flutter/material.dart';
import 'package:karobarone/practise/api/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SampleProfile extends StatefulWidget {
  const SampleProfile({super.key});

  @override
  State<SampleProfile> createState() => _SampleProfile();
}

class _SampleProfile extends State<SampleProfile> {
  late Future<Map<String, dynamic>> profileFuture;

  @override
  void initState() {
    super.initState();
    profileFuture = loadProfile();
  }

  Future<Map<String, dynamic>> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
print(token);
    return ApiService().getProfile(token!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: profileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
      
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          final user = snapshot.data!;
      
          return Column(
            children: [
              Container(color: Colors.red, width: 50, height: 50),
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(user['image']),
              ),
              Text(user['firstName']),
              Text(user['email']),
              Text(user['username']),
            ],
          );
        },
      ),
    );
  }
}
