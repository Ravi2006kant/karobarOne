import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key, required productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(image: AssetImage("")),

            Text("Prooduct name"),
            Text("rating"),
            Row(
              children: [
                Text("pricing"),
                Text("before discount"),
                Text("discount"),
              ],
            ),
            Text("highlights"),

            Expanded(
              child: Row(
                children: [
                  ElevatedButton(onPressed: () {}, child: Text("Add to Cart")),
                  ElevatedButton(onPressed: () {}, child: Text("Buy Now")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
