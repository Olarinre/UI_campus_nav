import 'dart:convert';
import 'package:http/http.dart' as http;

class PlacesService {
  final String apiKey;

  PlacesService(this.apiKey);

  Future<List<String>> fetchSuggestions(String input) async {
    if (input.isEmpty) return [];
    Uri url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&location=7.4410%2C3.9067&radius=5000&key=$apiKey');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        // Parse the places
        List<String> suggestions = [];
        result['predictions'].forEach((p) {
          suggestions.add(p['description']);
        });
        return suggestions;
      }
      throw Exception('Failed to fetch suggestions');
    } else {
      throw Exception('Failed to load places API');
    }
  }
}
