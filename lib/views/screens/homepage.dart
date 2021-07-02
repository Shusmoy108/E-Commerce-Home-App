import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/controllers/controller.dart';
import 'package:home/models/product.dart';
import 'package:home/views/components/trendingproducts/trendingproduct.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final Controller controller = new Controller();
  Future<List<Product>> getTrendingProducts() async {
    return await controller.getTrendingProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.all(10),
          child: ListView(
            children: [
              FutureBuilder(
                future: getTrendingProducts(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                        child: Text("You have not posted any tutions yet..."),
                      ),
                    );
                  } else {
                    return TrendingProduct(snapshot.data);
                  }
                },
              )
            ],
          )),
    );
  }
}
