import 'package:home/models/product.dart';
import 'package:home/services/request.dart';

import 'errorcontroller.dart';

class Controller with ErrorController {
  final Request request = Request();
  Future<List<Product>> getTrendingProducts() async {
    List<Product> trendingProducts = [];
    var res = await request.get("opt=trendingProducts").catchError(handleError);
    for (var i = 0; i < res[0].length; i++) {
      trendingProducts.add(Product.fromJson(res[0][i]));
    }
    print(trendingProducts.length);
    return trendingProducts;
  }
}
