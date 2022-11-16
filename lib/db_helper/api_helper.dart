import 'dart:typed_data';

import 'package:http/http.dart' as http;

class APIHelper {
  APIHelper._();
  static final APIHelper apiHelper = APIHelper._();
  String uri = "https://source.unsplash.com/random/?";
  // String uri = "https://unsplash.com/photos/Q_3WmguWgYg";

  Future<Uint8List?> imageAPI() async {
    http.Response response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    return null;
  }
}
