import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:karobarone/components/appbarTop.dart';
import 'package:karobarone/components/defaultText.dart';
import 'package:karobarone/core/api/api_endpoints.dart';
import 'package:karobarone/core/models/address_model.dart';


class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final pincodeController = TextEditingController();
  final addressController = TextEditingController();
  final landmarkController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  String addressType = "HOME";

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    pincodeController.dispose();
    addressController.dispose();
    landmarkController.dispose();
    cityController.dispose();
    stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbartop(titleName: "Address"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Defaulttext(titleName: "Full Name"),
              SizedBox(height: 5),
              TextField(
                controller: nameController,

                keyboardType: .name,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10),

              Defaulttext(titleName: "Mobile Number"),
              SizedBox(height: 5),
              TextField(
                controller: mobileController,
                keyboardType: .number,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Defaulttext(titleName: "Pincode"),
              SizedBox(height: 5),
              TextField(
                controller: pincodeController,
                keyboardType: .number,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Defaulttext(titleName: "Address(house No,Building,Street)"),
              SizedBox(height: 5),
              TextField(
                controller: addressController,
                keyboardType: .name,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Defaulttext(titleName: "Landmark(optional)"),
              SizedBox(height: 5),
              TextField(
                controller: landmarkController,
                keyboardType: .name,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Defaulttext(titleName: "City"),
                        SizedBox(height: 5),
                        TextField(
                          controller: cityController,
                          keyboardType: .name,
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: .start,

                      children: [
                        Defaulttext(titleName: "State"),
                        SizedBox(height: 5),
                        TextField(
                          controller: stateController,
                          keyboardType: .name,
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text("Home"),
                      value: "HOME",
                      groupValue: addressType,
                      onChanged: (value) {
                        setState(() => addressType = value!);
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text("Work"),
                      value: "WORK",
                      groupValue: addressType,
                      onChanged: (value) {
                        setState(() => addressType = value!);
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text("Other"),
                      value: "OTHER",
                      groupValue: addressType,
                      onChanged: (value) {
                        setState(() => addressType = value!);
                      },
                    ),
                  ),
                ],
              ),

              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final address = Address(
                      id: "",
                      fullName: nameController.text.trim(),
                      phone: mobileController.text.trim(),
                      addressLine: addressController.text.trim(),
                      city: cityController.text.trim(),
                      state: stateController.text.trim(),
                      pincode: pincodeController.text.trim(),
                      landmark: landmarkController.text.trim(),
                      addressType: addressType,
                    );

                    const token =
                        "YOUR_JWT_TOKEN"; // Later load from SharedPreferences

                    try {
                      await ApiService().addAddress(address, token);
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Address Saved")),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(e.toString())));
                    }
                  },
                  child: const Text("Save Address"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
