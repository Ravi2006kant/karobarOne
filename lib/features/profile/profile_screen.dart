import 'package:flutter/material.dart';
import 'package:karobarone/features/profile/edit_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(25),
            ),

            child: Column(
              mainAxisAlignment: .spaceEvenly,

              children: [
                Row(
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.amber,
                      ),
                    ),

                    Column(
                      children: [
                        Text(
                          "Kalix Skyler",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: .bold,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(width: 15),
                        Text(
                          "ravi5gangster@gmail.com",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    //  Positioned(top: 10, child: Icon(Icons.edit)),
                  ],
                ),

                Divider(indent: 10, endIndent: 10, color: Colors.white),

                ListTile(
                  title: Row(
                    children: [
                      Icon(Icons.call, color: Colors.white, size: 18),
                      SizedBox(width: 5),
                      Text(
                        "Mobile Number",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: .bold,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23),
                    child: Text(
                      "+91 "
                      "65421234654",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  // trailing: Icon(Icons.edit),
                ),

                ListTile(
                  title: Row(
                    children: [
                      Icon(Icons.home, color: Colors.white, size: 18),
                      SizedBox(width: 5),
                      Text(
                        "Address",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: .bold,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23),
                    child: Text(
                      "this is my adderes hello thi sis my bro is vbad i amn good"
                      "you are bad i best",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  // trailing: Icon(Icons.edit),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.payment_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Payment Method",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: .bold,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23),
                    child: Text(
                      "this is my adderes hello thi sis my bro is vbad i amn good",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  // trailing: Icon(Icons.edit),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(Icons.storefront, color: Colors.white, size: 18),
                      SizedBox(width: 5),
                      Text(
                        "Become a Seller",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: .bold,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23),
                    child: Text(
                      "you are bad i best",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  // trailing: Icon(Icons.edit),
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfile()),
                );
              },
              icon: Icon(Icons.edit),
            ),
          ),
        ],
      ),
    );
  }
}
