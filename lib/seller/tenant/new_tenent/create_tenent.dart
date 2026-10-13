import 'package:flutter/material.dart';
import 'package:karobarone/components/tenent_textfield.dart';
import 'package:karobarone/core/api/api_endpoints.dart';
import 'package:karobarone/core/service/auth_service.dart';
import 'package:karobarone/features/home/screens/home.dart';

class CreateTenantScreen extends StatefulWidget {
  const CreateTenantScreen({super.key});

  @override
  State<CreateTenantScreen> createState() => _CreateTenantScreenState();
}

class _CreateTenantScreenState extends State<CreateTenantScreen> {

  final businessNameController = TextEditingController();
  final legalNameController = TextEditingController();
  final panNumberController = TextEditingController();
  final gstNumberController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final whatsappMobileController = TextEditingController();
  final ownerNameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final postalCodeController = TextEditingController();
  final businessTypeController = TextEditingController();
  final employeeCountController = TextEditingController();

  @override
  void dispose() {
    businessNameController.dispose();
    legalNameController.dispose();
    panNumberController.dispose();
    gstNumberController.dispose();
    emailController.dispose();
    mobileController.dispose();
    whatsappMobileController.dispose();
    ownerNameController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    postalCodeController.dispose();
    businessTypeController.dispose();
    employeeCountController.dispose();

    super.dispose();
  }

Future<void> next(Map<String, dynamic> data) async {
    final accessToken = await AuthService.instance.accToken();

    await ApiService().createTenant(
      accessToken: accessToken,
      tenantData: data,
    );

    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Home();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Create Business',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            TenentTextfield(
              text: "Business Name",
              cont: businessNameController,
              type: .name,
            ),

            TenentTextfield(
              text: "Legal Name",
              cont: legalNameController,
              type: .name,
            ),

            TenentTextfield(
              text: "PAN NUMBER",
              cont: panNumberController,
              type: .name,
            ),

            TenentTextfield(
              text: "GST Number",
              cont: gstNumberController,
              type: .name,
            ),

            TenentTextfield(
              text: "Business Email",
              cont: emailController,
              type: .name,
            ),

            TenentTextfield(
              text: "Mobile Number",
              cont: mobileController,
              type: .number,
            ),
            TenentTextfield(
              text: "Whatsapp Number",
              cont: whatsappMobileController,
              type: .name,
            ),

            TenentTextfield(
              text: "Owner Name",
              cont: ownerNameController,
              type: .name,
            ),

            TenentTextfield(
              text: "Business Address",
              cont: addressController,
              type: .name,
            ),
            TenentTextfield(text: "City", cont: cityController, type: .name),
            TenentTextfield(text: "State", cont: stateController, type: .name),
            TenentTextfield(
              text: "Postal Code",
              cont: postalCodeController,
              type: .name,
            ),

            TenentTextfield(
              text: "Business Type",
              cont: businessTypeController,
              type: .name,
            ),
            TenentTextfield(
              text: "Employee Count",
              cont: employeeCountController,
              type: .name,
            ),

            const SizedBox(height: 15),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  final tenantData = {
                    "businessName": businessNameController.text,
                    "legalName": legalNameController.text,
                    "panNumber": panNumberController.text,
                    "gstNumber": gstNumberController.text,
                    "email": emailController.text,
                    "mobile": mobileController.text,
                    "whatsappMobile": whatsappMobileController.text,
                    "ownerName": ownerNameController.text,
                    "businessAddressLine1": addressController.text,
                    "city": cityController.text,
                    "state": stateController.text,
                    "country": "India",
                    "postalCode": postalCodeController.text,
                    "businessType": businessTypeController.text,
                    "employeeCount":
                        int.tryParse(employeeCountController.text) ?? 0,
                  };

                  debugPrint(tenantData.toString());
                  next(tenantData);
                },
                child: const Text(
                  'Create Tenant',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
