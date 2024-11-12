import 'dart:convert';
import 'package:http/http.dart' as http;
import 'eletroposto.dart';

class ApiService {
  final String baseUrl = "https://eletropostos.azurewebsites.net/api/eletroposto";

  Future<List<Eletroposto>> fetchEletropostos() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => Eletroposto.fromJson(e)).toList();
    } else {
      throw Exception('Falha ao carregar os eletropostos');
    }
  }
}
