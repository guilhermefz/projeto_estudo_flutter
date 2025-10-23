class ProdutoModel {
  final String? id;
  final String nome;
  final String descricao;
  final double preco;
  final String? lojaId;

  ProdutoModel({
    this.id,
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.lojaId
  });

  //Fabrica que cria um produto model a partir de um json
  factory ProdutoModel.fromJson(Map<String, dynamic> json){
    return ProdutoModel(
      id:json['id']?.toString(),
      nome:json['nome']?? '',
      descricao:json['descricao']?? '',
      preco: (json['preco'] is num)
          ? (json['preco'] as num).toDouble()
          : double.tryParse(json['preco']?.toString() ?? '0') ?? 0.0,
      lojaId: json['lojaId']?.toString(),
    );
  }

  //converter o objeto produtoModel para o json
  Map<String, dynamic> toJson() => {
    'id': id,
    'nome': nome,
    'descricao': descricao,
    'preco': preco,
    'lojaId': lojaId,
  };
    
}




