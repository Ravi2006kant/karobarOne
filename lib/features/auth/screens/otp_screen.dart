import 'package:flutter/material.dart';
import 'package:karobarone/core/api/api_endpoints.dart';
import 'package:karobarone/features/home/screens/home.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.userId, required this.otpId});

  final String userId;
  final String otpId;

  @override
  Widget build(BuildContext context) {
    final TextEditingController otpcont = TextEditingController();
    // final args = ModalRoute.of(context)!.settings.arguments as Map;
    // final String contact = args['contact'];
    // final bool isRegister = args['isRegister'];

    // void pass() async {
    //   if (otpcont.text == "0000") {
    //     await AuthService().login(
    //       name: widget.name,
    //       mobile: widget.mobile,
    //       email: widget.email,
    //     );

    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (_) => HomeScreen()),
    //     );
    //   }
    // }


final apiservice = ApiService();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        children: [
          // Text("otp screen"),
          Expanded(
            child: Container(child: Center(child: Text("KarobarOne"))),
          ),

          Expanded(
            flex: 1,
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
                    Text(
                      "Enter the Security code we sent to",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: .center,
                        children: [
                          // Center(child: Text(contact)),
                          SizedBox(width: 5),
                          Icon(Icons.edit),
                        ],
                      ),
                    ),

                    SizedBox(height: 25),
                    Center(
                      child: Pinput(
                        length: 6,
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
                      final result =  apiservice.registerVerify(otpId, otpcont.text);
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
