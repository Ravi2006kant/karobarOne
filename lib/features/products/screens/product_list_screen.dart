import 'package:flutter/material.dart';
import 'package:karobarone/components/like_button.dart';
import 'package:karobarone/features/products/screens/product_detail_screen.dart';
import 'package:karobarone/practise/api/api_service.dart';
import 'package:karobarone/shared/widgets/loading_indicator.dart';

class ProductListScreen extends StatefulWidget {
  final String slu;
  const ProductListScreen({super.key, required this.slu});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.slu.toUpperCase(),
          style: TextStyle(color: Colors.white, fontWeight: .bold),
        ),
      ),
      body: FutureBuilder(
        future: apiService.getProductByCateogry(widget.slu),

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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          // productId: products[index]['title'],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.amber,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Image.network(
                            products[index]['images'][0],
                            width: 100,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              ListTile(
                                title: Text(products[index]['title']),
                                // trailing: LikeButton(),
                                trailing: IconButton(
                                  onPressed: () async {
                                    final result = await apiService
                                        .deleteProduct(products[index]['id']);
                                    print(result);
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(products[index]['price'].toString()),
                                  const SizedBox(width: 25),
                                  Text(
                                    products[index]['discountPercentage']
                                        .toString(),
                                  ),
                                ],
                              ),
                              Text(products[index]['category']),
                            ],
                          ),
                        ),
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
