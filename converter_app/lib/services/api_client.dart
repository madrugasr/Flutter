import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart' as http;

class ApiClient {
  final Uri currencyURL = Uri.https("free.currconv.com", "/api/v7/currencies",
      {"apiKey": "4f6ef6f6c136f9f2e860"});

  Future<List<String>> getCurrencies() async {
    http.Response res = await http.get((currencyURL));
    if (res.statusCode == 200) {
      var body = jsonDecode((res.body));
      var list = body["results"];
      List<String> currencies = (list.keys).toList();
      print(currencies);
      return currencies;
    } else {
      throw Exception("Falha de conexão com a API.");
    }
  }

  //Obtendo taxa de Câmbio.
  Future<double> getRate(String from, String to) async {
    final Uri rateUrl = Uri.https('free.currconv.com', '/api/v7/convert', {
      "apiKey": "4f6ef6f6c136f9f2e860",
      "q": "${from}_${to}",
      "compact": "ultra"
    });
    http.Response res = await http.get(rateUrl);
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      return body["${from}_${to}"];
    } else {
      throw Exception("Falha conexão com a API.");
    }
  }
}
