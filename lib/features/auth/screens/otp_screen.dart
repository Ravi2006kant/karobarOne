import 'package:flutter/material.dart';
import 'package:karobarone/features/auth/screens/register_screen.dart';
import 'package:karobarone/features/home/screens/home.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});
  TextEditingController otpcont = TextEditingController();
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
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        "We just send an SMS",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: .bold,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    SizedBox(height: 5),
                    Text("Enter the Security code we sent to"),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: .center,
                        children: [
                          Center(child: Text("1234567890")),
                          SizedBox(width: 5),
                          Icon(Icons.edit),
                        ],
                      ),
                    ),

                    SizedBox(height: 25),
                    Center(
                      child: Pinput(
                        controller: otpcont,
                        animationCurve: Curves.decelerate,
                      ),
                    ),

                    SizedBox(height: 25),
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
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      child: Text("Verify"),
                    ),
                    SizedBox(height: 10),
                    Column(
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          "Don't receive Code ?",
                          style: TextStyle(color: Colors.black),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Resend",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: .bold,
                            ),
                          ),
                        ),
                      ],
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
