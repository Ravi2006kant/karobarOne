import 'package:flutter/material.dart';
import 'package:karobarone/components/like_button.dart';
import 'package:karobarone/practise/api/api_service.dart';
import 'package:karobarone/shared/widgets/loading_indicator.dart';

class ProductListScreen extends StatelessWidget {
  final String slu;
  const ProductListScreen({super.key, required this.slu});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          slu.toUpperCase(),
          style: TextStyle(color: Colors.white, fontWeight: .bold),
        ),
      ),
      body: FutureBuilder(
        future: apiService.getProductByCateogry(slu),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingIndicator();
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final products = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    color: Colors.amber,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(products[index]['title']),
                          trailing: LikeButton(),
                        ),
                        Row(
                          children: [
                            Text(products[index]['price'].toString()),
                            const SizedBox(width: 25),
                            Text(
                              products[index]['discountPercentage'].toString(),
                            ),
                          ],
                        ),
                        Text(products[index]['category']),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
          );
        },
      ),
    );
  }
}

/*

image 
title
description
price
rating
brand
category


*/
