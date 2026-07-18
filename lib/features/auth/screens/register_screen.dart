import 'package:flutter/material.dart';
import 'package:karobarone/features/auth/screens/login_screen.dart';
import 'package:karobarone/features/auth/screens/otp_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  TextEditingController name = TextEditingController();
  TextEditingController mobileCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        children: [
          Expanded(
            child: Container(child: Center(child: Text("KarobarOne"))),
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
                    //button container
                    // Container(
                    //   height: 50,
                    //   margin: EdgeInsets.symmetric(
                    //     horizontal: 25,
                    //     vertical: 15,
                    //   ),
                    //   decoration: BoxDecoration(
                    //     color: Theme.of(context).colorScheme.primary,
                    //     borderRadius: BorderRadius.circular(25),
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         child: Container(
                    //           padding: EdgeInsets.symmetric(
                    //             horizontal: 46,
                    //             vertical: 5,
                    //           ),

                    //           margin: EdgeInsets.all(5),
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(25),
                    //             color: Colors.white,
                    //           ),

                    //           child: Center(
                    //             child: Text(
                    //               "LOGIN",
                    //               style: TextStyle(
                    //                 fontWeight: .bold,
                    //                 color: Colors.black,
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        "R E G I S T E R",
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
                    Row(
                      mainAxisAlignment: .center,
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OtpScreen()),
                        );
                      },
                      child: Text("Register"),
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
