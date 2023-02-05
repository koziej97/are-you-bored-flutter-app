import 'package:http/http.dart' as http;

class ActivityProvider {
  static const String _baseUrl = "http://www.boredapi.com/api/activity/";

  static Future<String> getRandomActivity() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200){
      return response.body;
    } else {
      throw Exception("Failed to load activity");
    }
  }
}