import 'dart:convert';

Story storyFromJson(String str) => Story.fromJson(json.decode(str));

String storyToJson(Story data) => json.encode(data.toJson());

class Story {
  Story({
    required this.storyTime,
    required this.story,
    required this.storyType,
    required this.storyImage,
    required this.storyAdditionalImages,
    required this.promoImage,
    required this.orderQty,
    required this.lastAddToCart,
    required this.availableStock,
    required this.myId,
    required this.ezShopName,
    this.companyName,
    this.companyLogo,
    this.companyEmail,
    required this.currencyCode,
    required this.unitPrice,
    required this.discountAmount,
    required this.discountPercent,
    required this.iMyId,
    required this.shopName,
    required this.shopLogo,
    required this.shopLink,
    required this.friendlyTimeDiff,
    required this.slNo,
  });

  DateTime storyTime;
  String story;
  String storyType;
  String storyImage;
  String storyAdditionalImages;
  String promoImage;
  int orderQty;
  DateTime lastAddToCart;
  int availableStock;
  String myId;
  String ezShopName;
  dynamic companyName;
  dynamic companyLogo;
  dynamic companyEmail;
  String currencyCode;
  int unitPrice;
  int discountAmount;
  int discountPercent;
  String iMyId;
  String shopName;
  String shopLogo;
  String shopLink;
  String friendlyTimeDiff;
  String slNo;

  factory Story.fromJson(Map<String, dynamic> json) => Story(
        storyTime: DateTime.parse(json["storyTime"]),
        story: json["story"],
        storyType: json["storyType"],
        storyImage: json["storyImage"],
        storyAdditionalImages: json["storyAdditionalImages"] == null
            ? ""
            : json["storyAdditionalImages"],
        promoImage: json["promoImage"],
        orderQty: json["orderQty"],
        lastAddToCart: DateTime.parse(json["lastAddToCart"]),
        availableStock: json["availableStock"],
        myId: json["myId"],
        ezShopName: json["ezShopName"],
        companyName: json["companyName"],
        companyLogo: json["companyLogo"],
        companyEmail: json["companyEmail"],
        currencyCode: json["currencyCode"],
        unitPrice: json["unitPrice"],
        discountAmount: json["discountAmount"],
        discountPercent: json["discountPercent"],
        iMyId: json["iMyID"],
        shopName: json["shopName"],
        shopLogo: json["shopLogo"],
        shopLink: json["shopLink"],
        friendlyTimeDiff: json["friendlyTimeDiff"],
        slNo: json["slNo"],
      );

  Map<String, dynamic> toJson() => {
        "storyTime": storyTime.toIso8601String(),
        "story": story,
        "storyType": storyType,
        "storyImage": storyImage,
        "storyAdditionalImages": storyAdditionalImages,
        "promoImage": promoImage,
        "orderQty": orderQty,
        "lastAddToCart": lastAddToCart.toIso8601String(),
        "availableStock": availableStock,
        "myId": myId,
        "ezShopName": ezShopName,
        "companyName": companyName,
        "companyLogo": companyLogo,
        "companyEmail": companyEmail,
        "currencyCode": currencyCode,
        "unitPrice": unitPrice,
        "discountAmount": discountAmount,
        "discountPercent": discountPercent,
        "iMyID": iMyId,
        "shopName": shopName,
        "shopLogo": shopLogo,
        "shopLink": shopLink,
        "friendlyTimeDiff": friendlyTimeDiff,
        "slNo": slNo,
      };
}
