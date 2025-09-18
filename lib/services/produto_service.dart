import 'package:http/http.dart' as http;

const String baseUrl = 'http://localhost:8080/produtos';

class ProdutoService{
  final http.Client _client;

  ProdutoService({http.Client? client}) : _client = client ?? http.Client();


  Uri _u(String path) => Uri.parse('$baseUrl$path');

  //Future<List<ProdutoModel>> listar()  async{
    //final response = await _client.get(_u('/listar'));
    //final response = await _client.get(Uri.parse(baseUrl + '/listar'));
    //if(response.statusCode == 200){

    //}
  //}
}