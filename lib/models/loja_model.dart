class LojaModel {
  final String? id;
  final String nome;
  final String cnpj;
  final String endereco;
  final String telefone;

  LojaModel({
    this.id,
    required this.nome,
    required this.cnpj,
    required this.endereco,
    required this.telefone
  });

  //Fabrica que cria um produto model a partir de um json
  factory LojaModel.fromJson(Map<String, dynamic> json){
    return LojaModel(
        id:json['id']?.toString(),
        nome:json['nome']?? '',
        cnpj:json['cnpj']?? '',
        endereco: json['endereco']?? '',
        telefone: json['telefone']?? ''
    );
  }

  //converter o objeto produtoModel para o json
  Map<String, dynamic> toJson() => {
    'id': id,
    'nome': nome,
    'cnpj': cnpj,
    'endereco': endereco,
    'telefone': telefone
  };

}




