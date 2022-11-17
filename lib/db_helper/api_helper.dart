import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

class APIHelper {
  APIHelper._();
  static final APIHelper apiHelper = APIHelper._();
  // String uri = "https://source.unsplash.com/random/?";
  String uri = "https://api.jikan.moe/v3/top/anime/1";

  Future<List?> imageAPI() async {
    http.Response response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      var topShowsJson = jsonDecode(response.body)['top'] as List;
      return topShowsJson.map((e) => e.fromJson(e)).toList();
    }
    return null;
  }
}
