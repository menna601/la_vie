import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  static Future sendPostRequest(
      String path, Map<String, dynamic>? params) async {
    Uri url = Uri.https('lavie.orangedigitalcenteregypt.com', path);
    http.Response response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(params));
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  static Future sendGetRequest(String path, Map<String, dynamic>? params,
      Map<String, String>? headers) async {
    Uri url = Uri.https('lavie.orangedigitalcenteregypt.com', path, params);
    if (headers != null) headers.addAll({'Content-Type': 'application/json'});
    http.Response response = await http.get(url,
        headers:
            headers != null ? headers : {'Content-Type': 'application/json'});
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }
}
