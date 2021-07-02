import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:home/enviroments/common.dart';
import 'package:home/services/appexeception.dart';
import 'package:http/http.dart' as http;

class Request {
  Future<dynamic> get(String api) async {
    var uri = Uri.parse(SERVER_URL + api);
    try {
      var response =
          await http.get(uri).timeout(Duration(seconds: TIME_OUT_DURATION));
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        return res;
      } else {
        throw FetchDataException(
            "Something Went Wrong. Please try again later.", uri.toString());
      }
    } on SocketException {
      throw FetchDataException("No internet connection.", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "Sorry the server is under maintainance break. We will get back to you as soon as possible.",
          uri.toString());
    }
  }

  Future<dynamic> post(String api, dynamic payloadobj) async {
    var uri = Uri.parse(SERVER_URL + api);
    var payload = jsonEncode(payloadobj);

    try {
      var response = await http
          .post(uri,
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: payload)
          .timeout(Duration(seconds: TIME_OUT_DURATION));
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        return res;
      } else {
        throw FetchDataException("Something Went Wrong", uri.toString());
      }
    } on SocketException {
      throw FetchDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "Sorry the server is under maintainance break. We will get back to you as soon as possible.",
          uri.toString());
    }
  }
}
