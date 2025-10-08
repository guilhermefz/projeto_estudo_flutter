import 'package:desenv_mobile/models/produto_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/material.dart';

import '../controllers/produto_controller.dart';
import '../services/produto_service.dart';

class ProdutoFormScreen extends StatefulWidget {
  final controller = Get.put(ProdutoController(
      service: ProdutoService()));

  @override
  State<ProdutoFormScreen> createState() => _FormProdutoState();
}
class _FormProdutoState extends State<ProdutoFormScreen> {
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _precoController = TextEditingController();
  String? id;

  @override
  void  initState(){
    super.initState();
    final arg = Get.arguments;
    if(arg != null && arg is ProdutoModel){
      id = arg.id;
      _nomeController.text = arg.nome;
      _descricaoController.text = arg.descricao;
      _precoController.text = arg.preco.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Produto'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descricaoController,
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _precoController,
              decoration: const InputDecoration(labelText: 'Preço'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {

              },
              child: const Text('Salvar Produto'),
            ),
          ],
        ),
      ),
    );
  }
}