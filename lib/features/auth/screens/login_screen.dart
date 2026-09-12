import 'package:flutter/material.dart';
import 'package:karobarone/config/app_routes.dart';
import 'package:karobarone/core/api/api_endpoints.dart';
import 'package:karobarone/features/auth/screens/otp_screen.dart';
import 'package:karobarone/features/auth/screens/register_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController mobileCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();
  bool isloading = false;

  void navi() async {
    final data = await ApiService().login(mobileCont.text, passCont.text);

    // final token = data['accessToken'];
    // final refreshToken = data['refreshToken'];
    // final username = data['username'];
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setString('token', token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,

      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(child: Center(child: Text("KarobarOne"))),
          ),

          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.directional(
                topEnd: Radius.circular(25),
                topStart: Radius.circular(25),
              ),

              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        "L O G I N",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: .bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.black),
                        controller: emailCont,
                        decoration: InputDecoration(
                          hintText: "Enter Email",
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.email_rounded,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        controller: passCont,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          hintStyle: TextStyle(color: Colors.black),
                          fillColor: Colors.black,
                          focusColor: Colors.black,
                          prefixIcon: Icon(
                            Icons.remove_red_eye_sharp,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          "Don't have account ?",
                          style: TextStyle(color: Colors.black),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          child: Text(
                            " Register",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: .bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Theme.of(context).colorScheme.primary,
                        ),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                      onPressed: isloading
                          ? null
                          : () {
                              navi();
                              // Navigator.pushNamed(context, AppRoutes.home);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      OtpScreen(userId: '', otpId: ''),
                                ),
                              );
                            },
                      child: isloading
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : Text("Send Otp"),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("Forget Password"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
