// To parse this JSON data, do
//
//     final trendingProduct = trendingProductFromJson(jsonString);

import 'dart:convert';

Shop trendingProductFromJson(String str) => Shop.fromJson(json.decode(str));

String trendingProductToJson(Shop data) => json.encode(data.toJson());

class Shop {
  Shop({
    required this.slNo,
    required this.sellerName,
    required this.sellerProfilePhoto,
    required this.sellerItemPhoto,
    required this.ezShopName,
    required this.defaultPushScore,
    this.aboutCompany,
    required this.allowCod,
    this.division,
    this.subDivision,
    required this.city,
    required this.state,
    required this.zipcode,
    required this.country,
    required this.currencyCode,
    required this.orderQty,
    required this.orderAmount,
    required this.salesQty,
    required this.salesAmount,
    required this.highestDiscountPercent,
    required this.lastAddToCart,
    required this.lastAddToCartThatSold,
  });

  String slNo;
  String sellerName;
  String sellerProfilePhoto;
  String sellerItemPhoto;
  String ezShopName;
  double defaultPushScore;
  dynamic aboutCompany;
  int allowCod;
  dynamic division;
  dynamic subDivision;
  String city;
  String state;
  String zipcode;
  String country;
  String currencyCode;
  int orderQty;
  int orderAmount;
  int salesQty;
  int salesAmount;
  int highestDiscountPercent;
  DateTime lastAddToCart;
  DateTime lastAddToCartThatSold;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        slNo: json["slNo"],
        sellerName: json["sellerName"],
        sellerProfilePhoto: json["sellerProfilePhoto"],
        sellerItemPhoto: json["sellerItemPhoto"],
        ezShopName: json["ezShopName"],
        defaultPushScore: json["defaultPushScore"].toDouble(),
        aboutCompany: json["aboutCompany"],
        allowCod: json["allowCOD"],
        division: json["division"],
        subDivision: json["subDivision"],
        city: json["city"] == null ? "" : json["city"],
        state: json["state"] == null ? "" : json["state"],
        zipcode: json["zipcode"] == null ? "" : json["zipcode"],
        country: json["country"] == null ? "" : json["country"],
        currencyCode: json["currencyCode"] == null ? "" : json["currencyCode"],
        orderQty: json["orderQty"],
        orderAmount: json["orderAmount"],
        salesQty: json["salesQty"],
        salesAmount: json["salesAmount"],
        highestDiscountPercent: json["highestDiscountPercent"],
        lastAddToCart: DateTime.parse(json["lastAddToCart"]),
        lastAddToCartThatSold: DateTime.parse(json["lastAddToCartThatSold"]),
      );

  Map<String, dynamic> toJson() => {
        "slNo": slNo,
        "sellerName": sellerName,
        "sellerProfilePhoto": sellerProfilePhoto,
        "sellerItemPhoto": sellerItemPhoto,
        "ezShopName": ezShopName,
        "defaultPushScore": defaultPushScore,
        "aboutCompany": aboutCompany,
        "allowCOD": allowCod,
        "division": division,
        "subDivision": subDivision,
        "city": city,
        "state": state,
        "zipcode": zipcode,
        "country": country,
        "currencyCode": currencyCode,
        "orderQty": orderQty,
        "orderAmount": orderAmount,
        "salesQty": salesQty,
        "salesAmount": salesAmount,
        "highestDiscountPercent": highestDiscountPercent,
        "lastAddToCart": lastAddToCart.toIso8601String(),
        "lastAddToCartThatSold": lastAddToCartThatSold.toIso8601String(),
      };
}
