import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:karobarone/features/image/image_screen.dart';
import 'package:karobarone/practise/api/api_service.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    XFile? selectedImage;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Cart", style: TextStyle(fontWeight: .bold)),
      ),
      body: Column(
        children: [
          Center(child: Text("cart")),
          ElevatedButton(
            onPressed: () async {
              final ImagePicker picker = ImagePicker();

              final XFile? image = await picker.pickImage(
                source: ImageSource.gallery,
              );

              if (image != null) {
                setState(() {
                  selectedImage = image;
                });
                await ApiService().uploadImage(selectedImage!.path);
              }
            },
            child: Text("upload Image"),
          ),
          selectedImage == null
              ? const Text("No Image Selected")
              : Image.file(File(selectedImage!.path), height: 220, fit: .cover),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedImage = null;
                  });
                },
                child: const Text("Cancel"),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: selectedImage == null
                    ? null
                    : () async {
                        await ApiService().uploadImage(selectedImage!.path);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Upload Successful")),
                        );
                      },
                child: const Text("Upload"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
