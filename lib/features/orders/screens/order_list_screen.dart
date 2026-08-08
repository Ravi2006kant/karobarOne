import 'package:flutter/material.dart';
import 'package:karobarone/practise/api/api_service.dart';

class OrderListScreen extends StatelessWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getProducts(),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final products = snapshot.data!;
          return Expanded(
            child: ListView.separated(
              itemCount: products.length,
              itemBuilder: (context, index) {
                // print(products[index]['thumbnail'].runtimeType);
                return Container(
                  child: Row(
                    children: [
                      // Image.network(products[index]['images'][0], width: 100),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(products[index]['title']),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(products[index]['price'].toString()),
                              Text(
                                products[index]['discount'].toString(),
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Text(products[index]['category']),
                          Text(products[index]['rating'].toString()),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          );
        },
      ),
    );
  }
}
