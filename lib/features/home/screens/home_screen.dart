import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TextEditingController searchCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SearchBar(
              backgroundColor: WidgetStatePropertyAll(Colors.yellow),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(20),
              width: 150,
              height: 150,

              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("Banner"),
            ),
          ), //banner
          SliverToBoxAdapter(child: Row(children: [Text("category")])),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Icon(Icons.face, size: 50),
                Icon(Icons.face, size: 50),
                Icon(Icons.face, size: 50),
                Icon(Icons.face, size: 50),
                Icon(Icons.face, size: 50),
              ],
            ),
          ),

          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {}),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          ),
          SliverToBoxAdapter(child: Row(children: [Text("Featured product")])),
          SliverList.builder(
            itemCount: 3,
            itemBuilder: ((context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                width: 50,
                height: 50,
                color: Colors.blue,
              );
            }),
          ),
        ],
      ),
    );
  }
}


// Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: SearchBar(
//               controller: searchCont,
//               backgroundColor: WidgetStatePropertyAll(
//                 Theme.of(context).colorScheme.onSecondary,
//               ),
//               textStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white)),
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(children: [
//                 /*everythign will be here*/
//                 ]),
//             ),
//           ),
//         ],
//       ),