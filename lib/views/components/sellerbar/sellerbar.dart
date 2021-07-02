import 'package:flutter/material.dart';
import 'package:home/models/shop.dart';

class SellerBar extends StatelessWidget {
  final List<Shop> shops;
  final String label;
  SellerBar(this.label, this.shops);
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        child: Container(
          height: 220,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) => ShopCart(this.shops[i]),
                      separatorBuilder: (context, i) => SizedBox(
                            width: 5,
                          ),
                      itemCount: shops.length))
            ],
          ),
        ));
  }
}

class ShopCart extends StatelessWidget {
  final Shop s;
  ShopCart(this.s);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(s.sellerProfilePhoto),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Colors.black26,
              ),
              child: Text(
                s.sellerName,
                style: TextStyle(color: Colors.white, fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            //shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: new NetworkImage(s.sellerItemPhoto),
            )));
  }
}
