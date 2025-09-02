import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class FetchMeme {
  static Future<Map<String, dynamic>?> getMemeData(String apiUrl) async {
    try {
      var url = Uri.parse(apiUrl);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        if (kDebugMode) {
          print("Meme JSON: ${response.body}");
        }

        return data;
      } else {
        log("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      log("Exception: $e");
      return null;
    }
  }
}