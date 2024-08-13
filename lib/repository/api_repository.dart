import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiRepository {

  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<dynamic>> fetchData() async {

    final response = await http.get(Uri.parse(apiUrl));

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    } else{
      throw Exception('Failed to load data');
    }

  }

}