import 'package:flutter/material.dart';
import 'package:karobarone/components/home_bottom_navi.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        children: [
          Expanded(child: Container()),

          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(25),
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    //button container
                    Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.purple.shade600,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            padding: EdgeInsets.symmetric(
                              horizontal: 54,
                              vertical: 5,
                            ),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                            ),

                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(fontWeight: .bold),
                              ),
                            ),
                          ),
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            padding: EdgeInsets.symmetric(
                              horizontal: 46,
                              vertical: 5,
                            ),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                            ),

                            child: Center(
                              child: Text(
                                "Register",
                                style: TextStyle(fontWeight: .bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,

                        decoration: InputDecoration(
                          labelText: "Enter Email",
                          prefixIcon: Icon(Icons.email_rounded),
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
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Enter Password",
                          prefixIcon: Icon(Icons.lock),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    Row(),

                    ElevatedButton(onPressed: () {}, child: Text("Login")),

                    Row(
                      children: [
                        Expanded(child: Divider()),
                        Text("or"),
                        Expanded(child: Divider()),
                      ],
                    ),

                    Icon(Icons.golf_course),
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


/*

DefaultTabController(
                      length: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        child: Container(
                          
                          child: TabBar(
                            dividerColor: Colors.red,
                            indicatorColor: Colors.amber,
                            labelColor: Theme.of(context).colorScheme.primary,
                          
                            tabs: [
                              Tab(icon: Icon(Icons.login)),
                              Tab(icon: Icon(Icons.wallet)),
                            ],
                          ),
                        ),
                      ),
                    ),


*/