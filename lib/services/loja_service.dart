import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/loja_model.dart';

const String baseUrl = 'http://localhost:8080/loja';

class LojaService{
  final http.Client _client;

  LojaService({http.Client? client}) : _client = client ?? http.Client();


  Uri _u(String path) => Uri.parse('$baseUrl$path');

  Future<List<LojaModel>> listar()  async{
    //final response = await _client.get(_u('/listar'));
    final response = await _client.get(Uri.parse(baseUrl + '/listar'));
    if(response.statusCode >= 200 && response.statusCode < 300){
      final data = jsonDecode(response.body) as List;
      return data.map((e) => LojaModel.fromJson(e)).toList();
    }
    throw Exception('Erro ao listar lojas: ${response.statusCode}');
  }
}