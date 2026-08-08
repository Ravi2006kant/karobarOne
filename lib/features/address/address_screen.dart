import 'package:flutter/material.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Address")),
      body: Column(
        crossAxisAlignment: .start,
        children: [
          Text("Full Name"),
          TextField(),
          Text("Mobile Number"),
          TextField(),
          Text("Pincode"),
          TextField(),
          Text("Address,(house No,Building,Street)"),
          TextField(),
          Text("Landmark(optional)"),
          TextField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(child: Text("Full Name")),
              Container(child: Text("Full Name")),
            ],
          ),
          Row(
            children: [
              Radio(
                value: Text("Home", style: TextStyle(color: Colors.amber)),
                toggleable: true,
              ),
              Radio(value: false),
              Radio(value: Text("Other")),
            ],
          ),
          Checkbox(value: false, onChanged: (context) {}),
          ElevatedButton(onPressed: () {}, child: Text("Save Address")),
        ],
      ),
    );
  }
}
