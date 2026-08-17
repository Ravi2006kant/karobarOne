import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:karobarone/features/image.dart/image_screen.dart';
import 'package:karobarone/practise/api/api_service.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                await ApiService().uploadImage(image.path);
              }
            },
            child: Text("upload Image"),
          ),
        ],
      ),
    );
  }
}
