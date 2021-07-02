class Helper {
  static String priceFormat(String price) {
    String formatedPrice = "";
    var str = price.split(".");
    if (str[0].length <= 4) {
      formatedPrice = formatedPrice + str[0];
    } else if (str[0].length <= 5) {
      formatedPrice = formatedPrice +
          str[0].substring(0, 2) +
          "," +
          str[0].substring(2, str[0].length);
    } else if (str[0].length <= 6) {
      formatedPrice = formatedPrice +
          str[0].substring(0, 1) +
          "," +
          str[0].substring(1, 3) +
          "," +
          str[0].substring(3, str[0].length);
    } else if (str[0].length <= 7) {
      formatedPrice = formatedPrice +
          str[0].substring(0, 2) +
          "," +
          str[0].substring(2, 4) +
          "," +
          str[0].substring(4, str[0].length);
    } else if (str[0].length <= 8) {
      formatedPrice = formatedPrice +
          str[0].substring(0, 1) +
          "," +
          str[0].substring(1, 3) +
          "," +
          str[0].substring(3, 5) +
          "," +
          str[0].substring(5, str[0].length);
    } else if (str[0].length <= 9) {
      formatedPrice = formatedPrice +
          str[0].substring(0, 2) +
          "," +
          str[0].substring(2, 4) +
          "," +
          str[0].substring(4, 6) +
          "," +
          str[0].substring(6, str[0].length);
    } else if (str[0].length <= 10) {
      formatedPrice = formatedPrice +
          str[0].substring(0, 3) +
          "," +
          str[0].substring(3, 5) +
          "," +
          str[0].substring(5, 7) +
          "," +
          str[0].substring(7, str[0].length);
    }

    if (str.length == 2) {
      formatedPrice = formatedPrice + "." + str[1];
    } else {
      formatedPrice = formatedPrice + "." + "0";
    }

    return formatedPrice;
  }
}
