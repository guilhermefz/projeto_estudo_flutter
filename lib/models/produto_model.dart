class ProdutoModel {
  final String? id;
  final String nome;
  final String descricao;
  final double preco;

  ProdutoModel({
    this.id,
    required this.nome,
    required this.descricao,
    required this.preco
  });

  //Fabrica que cria um produto model a partir de um json
  factory ProdutoModel.fromJson(Map<String, dynamic> json){
    return ProdutoModel(
      id:json['id']?.toString(),
      nome:json['nome']?? '',
      descricao:json['decricao']?? '',
      preco: (json['preco'] is num)
          ? (json['preco'] as num).toDouble()
          : double.tryParse(json['preco']?.toString() ?? '0') ?? 0.0
    );
  }

  //converter o objeto produtoModel para o json
  Map<String, dynamic> toJson() => {
    'id': id,
    'nome': nome,
    'descricao': descricao,
    'preco': preco
  };
    
}




