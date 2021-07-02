import 'dart:convert';

TrendingProduct trendingProductFromJson(String str) =>
    TrendingProduct.fromJson(json.decode(str));

String trendingProductToJson(TrendingProduct data) =>
    json.encode(data.toJson());

class TrendingProduct {
  TrendingProduct({
    required this.slNo,
    required this.productName,
    required this.shortDetails,
    required this.productDescription,
    required this.availableStock,
    required this.orderQty,
    required this.salesQty,
    required this.orderAmount,
    required this.salesAmount,
    required this.discountPercent,
    required this.discountAmount,
    required this.unitPrice,
    required this.productImage,
    required this.sellerName,
    required this.sellerProfilePhoto,
    required this.sellerCoverPhoto,
    required this.ezShopName,
    required this.defaultPushScore,
    required this.myProductVarId,
  });

  String slNo;
  String productName;
  String shortDetails;
  String productDescription;
  int availableStock;
  int orderQty;
  int salesQty;
  int orderAmount;
  int salesAmount;
  int discountPercent;
  int discountAmount;
  int unitPrice;
  String productImage;
  String sellerName;
  String sellerProfilePhoto;
  String sellerCoverPhoto;
  String ezShopName;
  int defaultPushScore;
  String myProductVarId;

  factory TrendingProduct.fromJson(Map<String, dynamic> json) =>
      TrendingProduct(
        slNo: json["slNo"],
        productName: json["productName"],
        shortDetails: json["shortDetails"],
        productDescription: json["productDescription"],
        availableStock: json["availableStock"],
        orderQty: json["orderQty"],
        salesQty: json["salesQty"],
        orderAmount: json["orderAmount"],
        salesAmount: json["salesAmount"],
        discountPercent: json["discountPercent"],
        discountAmount: json["discountAmount"],
        unitPrice: json["unitPrice"],
        productImage: json["productImage"],
        sellerName: json["sellerName"],
        sellerProfilePhoto: json["sellerProfilePhoto"],
        sellerCoverPhoto: json["sellerCoverPhoto"],
        ezShopName: json["ezShopName"],
        defaultPushScore: json["defaultPushScore"],
        myProductVarId: json["myProductVarId"],
      );

  Map<String, dynamic> toJson() => {
        "slNo": slNo,
        "productName": productName,
        "shortDetails": shortDetails,
        "productDescription": productDescription,
        "availableStock": availableStock,
        "orderQty": orderQty,
        "salesQty": salesQty,
        "orderAmount": orderAmount,
        "salesAmount": salesAmount,
        "discountPercent": discountPercent,
        "discountAmount": discountAmount,
        "unitPrice": unitPrice,
        "productImage": productImage,
        "sellerName": sellerName,
        "sellerProfilePhoto": sellerProfilePhoto,
        "sellerCoverPhoto": sellerCoverPhoto,
        "ezShopName": ezShopName,
        "defaultPushScore": defaultPushScore,
        "myProductVarId": myProductVarId,
      };
}
