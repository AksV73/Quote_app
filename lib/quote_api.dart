import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quote_app/quotemodel.dart';

class QuoteApi {
  final String _baseUrl = 'https://api.quotable.io/random';

  Future<QUOTE> GETRandomQuote() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return QUOTE.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}