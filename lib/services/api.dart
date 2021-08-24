import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiAnfiya {
  dynamic post(String method, dynamic body) {
    Uri api_url = "https://anfiya.octra.io/api/${method}" as Uri;

    http.post(api_url, body: body).then((value) {
      print(value.body);
      var json = jsonDecode(value.body);
      return json;
    }).catchError((onError) {
      throw (onError);
    });
  }

  Future<dynamic> get(String u, method) async {
    Uri url = Uri.https(u, method);
    return http.get(url);
  }
}
