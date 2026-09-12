import 'package:flutter/material.dart';
import 'package:karobarone/core/api/api_endpoints.dart';
import 'package:karobarone/core/models/product_model.dart';
import 'package:karobarone/practise/api/api_service.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  List<Product> products = [];

  int limit = 10;
  int skip = 0;

  bool isLoading = false;
  final apiService = ApiService();

  Future<void> loadMore() async {
    if (isLoading) return;

    isLoading = true;

    final newProducts = await apiService.getProducts(limit, skip);

    setState(() {
      products.addAll(newProducts);
      skip += limit;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController scontroller = ScrollController();
    @override
    void initState() {
      super.initState();

      loadMore();

      scontroller.addListener(() {
        if (scontroller.position.pixels ==
            scontroller.position.maxScrollExtent) {
          loadMore();
        }
      });
    }

    return Scaffold(
      body: FutureBuilder(
        future: apiService.getProducts(10, 10),

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
              controller: scontroller,
              itemCount: products.length,
              itemBuilder: (context, index) {
                // print(products[index]['thumbnail'].runtimeType);
                return Container(
                  child: Row(
                    children: [
                      Image.network(products[index].thumbnail[0], width: 100),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(products[index].title),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(products[index].price.toString()),
                              Text(
                                products[index].discount.toString(),
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Text(products[index].category),
                          Text(products[index].rating.toString()),
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
