import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/menu_component.dart';
import '../models/loja_model.dart';
import '../services/loja_service.dart';

class LojaFormScreen extends StatefulWidget {
  const LojaFormScreen({Key? key}) : super(key: key);

  @override
  State<LojaFormScreen> createState() => _LojaFormScreenState();
}

class _LojaFormScreenState extends State<LojaFormScreen> {
  final _nomeController = TextEditingController();
  final _cnpjController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _service = LojaService(); // Instância do serviço


  Future<void> _salvarLoja() async {
    // 1. Criar um novo objeto LojaModel com os dados do formulário
    final novaLoja = LojaModel(
      nome: _nomeController.text,
      cnpj: _cnpjController.text,
      endereco: _enderecoController.text,
      telefone: _telefoneController.text,
    );

    // 2. Chamar o serviço para salvar a loja (essa lógica precisará ser implementada no LojaService)
    try {
      // await _service.salvar(novaLoja);
      Get.snackbar('Sucesso!', 'Loja salva com sucesso.');
      Get.back(); // Volta para a tela anterior
    } catch (e) {
      Get.snackbar('Erro', 'Não foi possível salvar a loja.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Loja'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const MenuComponent(),
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
              controller: _cnpjController,
              decoration: const InputDecoration(labelText: 'CNPJ'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _enderecoController,
              decoration: const InputDecoration(labelText: 'Endereço'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _telefoneController,
              decoration: const InputDecoration(labelText: 'Telefone'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _salvarLoja, // Chamar o método de salvar
              child: const Text('Salvar Loja'),
            ),
          ],
        ),
      ),
    );
  }
}