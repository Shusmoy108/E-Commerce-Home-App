import 'dart:convert';

import 'package:home/models/product.dart';
import 'package:home/models/shop.dart';
import 'package:home/models/story.dart';
import 'package:home/services/request.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'errorcontroller.dart';

class Controller with ErrorController {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final Request request = Request();
  Future<List<Product>> getTrendingProducts() async {
    final SharedPreferences prefs = await _prefs;

    List<Product> products = [];
    var res = await request.get("opt=trendingProducts").catchError(handleError);
    var data;
    if (res != null) {
      data = res[0];
      prefs.setString("trendingProducts", jsonEncode(res[0]));
    } else {
      if (prefs.getString("trendingProducts") != null) {
        data = jsonDecode(prefs.getString("trendingProducts")!);
      } else {
        data = [];
      }
    }
    for (var i = 0; i < data.length; i++) {
      products.add(Product.fromJson(data[i]));
    }

    return products;
  }

  Future<List<Shop>> getTrendingShops() async {
    List<Shop> shops = [];
    var res = await request.get("opt=trending_seller").catchError(handleError);
    final SharedPreferences prefs = await _prefs;
    var data;
    if (res != null) {
      data = res[0];
      prefs.setString("trending_seller", jsonEncode(res[0]));
    } else {
      if (prefs.getString("trending_seller") != null) {
        data = jsonDecode(prefs.getString("trending_seller")!);
      } else {
        data = [];
      }
    }
    for (var i = 0; i < data.length; i++) {
      shops.add(Shop.fromJson(data[i]));
    }

    return shops;
  }

  Future<List<Product>> getNewArivals() async {
    List<Product> products = [];
    var res = await request.get("opt=newArrivals").catchError(handleError);
    final SharedPreferences prefs = await _prefs;
    var data;
    if (res != null) {
      data = res[0];
      prefs.setString("newArrivals", jsonEncode(res[0]));
    } else {
      if (prefs.getString("newArrivals") != null) {
        data = jsonDecode(prefs.getString("newArrivals")!);
      } else {
        data = [];
      }
    }
    for (var i = 0; i < data.length; i++) {
      products.add(Product.fromJson(data[i]));
    }

    return products;
  }

  Future<List<Shop>> getNewShops() async {
    List<Shop> shops = [];
    var res = await request.get("opt=newShops").catchError(handleError);
    final SharedPreferences prefs = await _prefs;
    var data;
    if (res != null) {
      data = res[0];
      prefs.setString("newShops", jsonEncode(res[0]));
    } else {
      if (prefs.getString("newShops") != null) {
        data = jsonDecode(prefs.getString("newShops")!);
      } else {
        data = [];
      }
    }
    for (var i = 0; i < data.length; i++) {
      shops.add(Shop.fromJson(data[i]));
    }

    return shops;
  }

  Future<List<Story>> getStories() async {
    List<Story> stories = [];
    var res = await request.get("opt=stories").catchError(handleError);
    final SharedPreferences prefs = await _prefs;
    var data;
    if (res != null) {
      data = res[0];
      prefs.setString("stories", jsonEncode(res[0]));
    } else {
      if (prefs.getString("stories") != null) {
        data = jsonDecode(prefs.getString("stories")!);
      } else {
        data = [];
      }
    }
    for (var i = 0; i < data.length; i++) {
      stories.add(Story.fromJson(data[i]));
    }

    return stories;
  }
}
