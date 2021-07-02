import 'package:flutter/material.dart';
import 'package:home/models/product.dart';

class ProductBar extends StatelessWidget {
  final List<Product> products;
  final String label;
  ProductBar(this.label, this.products);
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
                      itemBuilder: (context, i) =>
                          ProductCart(this.products[i]),
                      separatorBuilder: (context, i) => SizedBox(
                            width: 5,
                          ),
                      itemCount: products.length))
            ],
          ),
        ));
  }
}

class ProductCart extends StatelessWidget {
  final Product p;
  ProductCart(this.p);
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        child: Container(
            width: 120,
            height: 180,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  //clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(p.productImage),
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          p.productName,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Price: BDT ${p.unitPrice.toString()}.00",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ],
                    )),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              //shape: BoxShape.circle,
            )));
  }
}
