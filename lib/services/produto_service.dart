import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/loja_model.dart';
import '../models/produto_model.dart';

const String baseUrl = 'http://localhost:8080/produtos';

class ProdutoService{
  final http.Client _client;

  ProdutoService({http.Client? client}) : _client = client ?? http.Client();


  Uri _u(String path) => Uri.parse('$baseUrl$path');

    Future<List<ProdutoModel>> listar()  async{
    //final response = await _client.get(_u('/listar'));
    final response = await _client.get(Uri.parse(baseUrl + '/listar'));
    if(response.statusCode >= 200 && response.statusCode < 300){
      final data = jsonDecode(response.body) as List;
      return data.map((e) => ProdutoModel.fromJson(e)).toList();
    }
    throw Exception('Erro ao listar produtos: ${response.statusCode}');
  }

  Future<String> delete(String id) async {
    final res = await _client.post(Uri.parse(baseUrl + '/apagar/$id'));
    if(res.statusCode >= 200 && res.statusCode < 300){
      return "Removido com sucesso";
    }
    throw Exception('Erro ao apagar produto: ${res.statusCode}');
  }

  Future<ProdutoModel> salvar(ProdutoModel produto) async {
    final res = await _client.post(Uri.parse(baseUrl + '/salvar'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(produto),
    );
    if(res.statusCode >= 200 && res.statusCode < 300){
      return ProdutoModel.fromJson(jsonDecode(res.body));
    }
    throw Exception('Erro ao salvar produto: ${res.statusCode}');
  }

  Future<ProdutoModel> editar(ProdutoModel produtoModel) async {
    final res = await _client.post(Uri.parse(baseUrl + '/editar/${produtoModel.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(produtoModel),
    );
    if(res.statusCode >= 200 && res.statusCode < 300){
      return ProdutoModel.fromJson(jsonDecode(res.body));
    }
    throw Exception('Erro ao editar produto: ${res.statusCode}');
  }
}