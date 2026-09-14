import 'package:flutter/material.dart';
import 'package:karobarone/core/api/api_endpoints.dart';
import 'package:karobarone/features/auth/screens/otp_screen.dart';
import 'package:karobarone/features/auth/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final mobileCont = TextEditingController();

  final emailCont = TextEditingController();
  bool isLoading = false;
  final TextEditingController passCont = TextEditingController();

  Future<void> navi() async {
    try {
      setState(() => isLoading = true);

      final data = await ApiService().login(emailCont.text, passCont.text);

      final userId = data['userId'];
      final otpId = data['otpId'];

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              OtpScreen(userId: userId, otpId: otpId, purpose: 'login'),
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login failed: ${e.toString()}")),
        );
      }
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
    // await prefs.setString('token', token);
  }

  bool _passHide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,

      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              child: Center(
                child: Text(
                  "KarobarOne",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: .bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadiusDirectional.only(
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
                          fontWeight: FontWeight.bold,
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
                        obscureText: _passHide,
                        controller: passCont,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          hintStyle: TextStyle(color: Colors.black),
                          fillColor: Colors.black,
                          focusColor: Colors.black,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passHide
                                  ? Icons.visibility_rounded
                                  : Icons.visibility_off_rounded,
                            ),
                            onPressed: () {
                              setState(() {
                                _passHide = !_passHide;
                              });
                            },
                          ),
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
                      mainAxisAlignment: MainAxisAlignment.center,
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
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Theme.of(context).colorScheme.primary,
                        ),
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                      ),
                      onPressed: isLoading
                          ? null
                          : () async {
                              await navi();
                            },
                      child: isLoading
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
