import 'package:flutter/material.dart';
import 'package:karobarone/core/api/api_endpoints.dart';
import 'package:karobarone/features/auth/screens/login_screen.dart';
import 'package:karobarone/features/auth/screens/otp_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final name = TextEditingController();
  final lastname = TextEditingController();
  final mobileCont = TextEditingController();
  final emailCont = TextEditingController();
  final passwordcont = TextEditingController();
  bool isLoading = false;
  late Map<String, dynamic> result;

  Future<void> register() async {
    try {
      setState(() => isLoading = true);

      result = await ApiService().register(
        name.text,
        lastname.text,
        emailCont.text,
        mobileCont.text,
        mobileCont.text,
        passwordcont.text,
      );

      final userId = result['userId'];
      final otpId = result['otpId'];

      setState(() => isLoading = false);

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) =>
                OtpScreen(userId: userId, otpId: otpId, purpose: 'register'),
          ),
        );
      }
    } catch (e) {
      setState(() => isLoading = false);

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Registration failed: $e")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  "KarobarOne",
                  style: TextStyle(
                    fontWeight: .bold,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
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
                    SizedBox(height: 15),
                    Center(
                      child: Text(
                        "R E G I S T E R",
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
                        keyboardType: TextInputType.name,
                        style: TextStyle(color: Colors.black),
                        controller: name,
                        decoration: InputDecoration(
                          hintText: "Enter Name",
                          hintStyle: TextStyle(color: Colors.black),
                          fillColor: Colors.black,
                          focusColor: Colors.black,

                          prefixIcon: Icon(
                            Icons.person,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),

                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black),
                        controller: lastname,
                        decoration: InputDecoration(
                          hintText: "Enter last name",
                          hintStyle: TextStyle(color: Colors.black),
                          fillColor: Colors.black,
                          focusColor: Colors.black,
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),

                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black),
                        controller: mobileCont,
                        decoration: InputDecoration(
                          hintText: "Enter Mobile No.",
                          hintStyle: TextStyle(color: Colors.black),
                          fillColor: Colors.black,
                          focusColor: Colors.black,
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: emailCont,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Enter Email",
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.email_rounded,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),

                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black),
                        controller: passwordcont,
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          hintStyle: TextStyle(color: Colors.black),
                          fillColor: Colors.black,
                          focusColor: Colors.black,
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have account ?",
                          style: TextStyle(color: Colors.black),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            " Login",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Theme.of(context).colorScheme.primary,
                        ),
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                      ),
                      onPressed: () => register(),
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
                          : Text("Register"),
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
