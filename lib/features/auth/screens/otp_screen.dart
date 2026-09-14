import 'package:flutter/material.dart';
import 'package:karobarone/core/api/api_endpoints.dart';
import 'package:karobarone/core/service/auth_service.dart';
import 'package:karobarone/features/home/screens/home.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
    required this.userId,
    required this.otpId,
    required this.purpose,
  });
  final String purpose;
  final String userId;
  final String otpId;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpcont = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    otpcont.dispose();
    super.dispose();
  }

  Future<Map<String, dynamic>> _registerVerify() async {
    return await ApiService().registerVerify(widget.otpId, otpcont.text);
  }

  Future<Map<String, dynamic>> _loginVerify() async {
    return await ApiService().loginVerify(widget.otpId, otpcont.text);
  }

  Future<void> verifyOtp() async {
    setState(() => isLoading = true);

    try {
      final result = widget.purpose == "login"
          ? await _loginVerify()
          : await _registerVerify();

      print('OTP verify result: $result');
      final accessToken = result['accessToken'];
      final refreshToken = result['refreshToken'];
      final tokenType = result['tokenType'];

      await AuthService.instance.saveAuth(
        accessToken: accessToken,
        refreshToken: refreshToken,
        tokenType: tokenType,
        userId: widget.userId,
      );

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Home()),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('OTP verification failed: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

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
            flex: 1,
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
                        "We just send an SMS",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [SizedBox(width: 5), Icon(Icons.edit)],
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
                        backgroundColor: WidgetStateProperty.all(
                          Theme.of(context).colorScheme.primary,
                        ),
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                      ),

                      onPressed: isLoading ? null : verifyOtp,
                      child: isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text("Verify"),
                    ),

                    SizedBox(height: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                              fontWeight: FontWeight.bold,
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
