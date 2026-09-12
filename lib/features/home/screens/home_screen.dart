import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TextEditingController searchCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //Banner
          SliverToBoxAdapter(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  width: 150,
                  height: 150,

                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("Banner"),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  width: 150,
                  height: 150,

                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("Banner"),
                ),
                // Container(
                //   margin: EdgeInsets.all(20),
                //   width: 150,
                //   height: 150,

                //   decoration: BoxDecoration(
                //     color: Colors.red,
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: Text("Banner"),
                // ),
              ],
            ),
          ), //banner
        
          //categories
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text("Category", style: TextStyle(color: Colors.white)),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "View More",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          //category items
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 4.1,
            ),
            delegate: SliverChildBuilderDelegate(childCount: 8, (
              context,
              index,
            ) {
              return Container(child: Icon(Icons.face));
            }),
          ),
         
          //feature
          SliverToBoxAdapter(child: Row(children: [Text("Featured product")])),
         
          //feature items 
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
         
 
          SliverToBoxAdapter(child: Text("Service"),),
         
            //category items
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 4.1,
            ),
            delegate: SliverChildBuilderDelegate(childCount: 8, (
              context,
              index,
            ) {
              return Container(child: Icon(Icons.face));
            }),
          ),
         
          //feature
          SliverToBoxAdapter(child: Row(children: [Text("Featured product")])),
         
          //feature items 
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
         
 
          SliverToBoxAdapter(child: Text("Service"),),

        
        ],
      ),
    );
  }
}
 