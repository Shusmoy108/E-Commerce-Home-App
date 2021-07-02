import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/controllers/controller.dart';
import 'package:home/models/product.dart';
import 'package:home/models/shop.dart';
import 'package:home/models/story.dart';
import 'package:home/views/components/productbar/productbar.dart';
import 'package:home/views/components/sellerbar/sellerbar.dart';
import 'package:home/views/components/storycart/storycart.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final Controller controller = new Controller();
  late List<Story> stories = [];
  @override
  void initState() {
    super.initState();
    getStories();
  }

  void getStories() async {
    List<Story> story = await controller.getStories();
    setState(() {
      stories = story;
    });
  }

  List<Widget> getItems() {
    List<Widget> childs = [];
    for (var i = 6; i < this.stories.length; i++) {
      childs.add(StoryCart(this.stories[i]));
      childs.add(SizedBox(
        height: 10,
      ));
    }
    return childs;
  }

  Future<List<Product>> getTrendingProducts() async {
    return await controller.getTrendingProducts();
  }

  Future<List<Shop>> getTrendingSellers() async {
    return await controller.getTrendingShops();
  }

  Future<List<Product>> getNewArivals() async {
    return await controller.getNewArivals();
  }

  Future<List<Shop>> getNewShops() async {
    return await controller.getNewShops();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.all(10),
          child: ListView(
            children: [
              FutureBuilder(
                future: getTrendingSellers(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(),
                    );
                  } else {
                    return SellerBar("Trending Sellers", snapshot.data);
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: getTrendingProducts(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(),
                    );
                  } else {
                    return ProductBar("Trending Products", snapshot.data);
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              (stories.length > 0) ? StoryCart(this.stories[0]) : SizedBox(),
              (stories.length > 0)
                  ? SizedBox(
                      height: 10,
                    )
                  : SizedBox(),
              (stories.length > 1) ? StoryCart(this.stories[1]) : SizedBox(),
              (stories.length > 1)
                  ? SizedBox(
                      height: 10,
                    )
                  : SizedBox(),
              (stories.length > 2) ? StoryCart(this.stories[2]) : SizedBox(),
              (stories.length > 2)
                  ? SizedBox(
                      height: 10,
                    )
                  : SizedBox(),
              FutureBuilder(
                future: getNewArivals(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(),
                    );
                  } else {
                    return ProductBar("New Arrivals", snapshot.data);
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              (stories.length > 3) ? StoryCart(this.stories[3]) : SizedBox(),
              (stories.length > 3)
                  ? SizedBox(
                      height: 10,
                    )
                  : SizedBox(),
              (stories.length > 4) ? StoryCart(this.stories[4]) : SizedBox(),
              (stories.length > 4)
                  ? SizedBox(
                      height: 10,
                    )
                  : SizedBox(),
              (stories.length > 5) ? StoryCart(this.stories[5]) : SizedBox(),
              (stories.length > 5)
                  ? SizedBox(
                      height: 10,
                    )
                  : SizedBox(),
              FutureBuilder(
                future: getNewShops(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return SellerBar("New Shops", snapshot.data);
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              (stories.length > 6) ? Column(children: getItems()) : SizedBox(),
              (stories.length > 6)
                  ? SizedBox(
                      height: 10,
                    )
                  : SizedBox(),
            ],
          )),
    );
  }
}
