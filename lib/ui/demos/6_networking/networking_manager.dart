import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';

class NetworkingManager {
  ValueNotifier catNotifier = ValueNotifier(Map<String, dynamic>);

  Future<void> getRequest() async {
    // final uri = Uri.parse("https://www.miu.edu.mn/");
    // final uri = Uri.parse("https://example.com/api/fetch?limit=10,20,30&max=100");
    // final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
    final uri = Uri.parse("https://catfact.ninja/fact");
    final response = await get(uri);

    final jsonResponse = response.body;
    catNotifier = jsonDecode(jsonResponse);
  }
  Future<void> postRequest() async {
    final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
      // Map<String, String>? headers,
      // Object? body,
      // Encoding? encoding,
    final headers = {
      "Accept-Language": "en-US", 
      "Content-Language": "en-US", 
      "Content-Type": "application/JSON",
    };
    final example = {
      "name": "Bob",
      "age": 20,
      "time": "14:00",
    };
    post(uri, headers: headers, body: example, encoding: Encoding.getByName("UTF-8"));
  } 
}