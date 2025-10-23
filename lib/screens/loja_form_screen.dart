import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/menu_component.dart';
import '../controllers/loja_controller.dart';
import '../models/loja_model.dart';
import '../services/loja_service.dart';

class LojaFormScreen extends StatefulWidget {
  final controller = Get.put(LojaController(
      service: LojaService()));


  @override
  State<LojaFormScreen> createState() => _LojaFormScreenState();
}

class _LojaFormScreenState extends State<LojaFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _cnpjController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _telefoneController = TextEditingController();
  String? id;

  @override
  void initState(){
    super.initState();
    final arg = Get.arguments;
    if(arg != null && arg is LojaModel){
      id = arg.id;
      _nomeController.text = arg.nome;
      _cnpjController.text = arg.cnpj;
      _enderecoController.text = arg.endereco;
      _telefoneController.text = arg.telefone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Loja'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: MenuComponent(),
      body:
      Padding(padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child:
          ListView(
          children: [
            TextFormField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _cnpjController,
              decoration: const InputDecoration(labelText: 'CNPJ'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _enderecoController,
              decoration: const InputDecoration(labelText: 'Endereço'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _telefoneController,
              decoration: const InputDecoration(labelText: 'Telefone'),
            ),
            const SizedBox(height: 32),
              Obx(() => ElevatedButton.icon(
                  onPressed: widget.controller.isLoading.value ? null
                      :(){
                        if(_formKey.currentState!.validate()){
                          widget.controller.salvar(
                            nome: _nomeController.text,
                            cnpj: _cnpjController.text,
                            endereco: _enderecoController.text,
                            telefone: _telefoneController.text
                          );
                        }
                      },
                  icon: Icon(Icons.save),
                  label: Text(
                    widget.controller.isLoading.value ? 'Salvando...': 'Salvar'
                  ),
                )
              )
          ],
          ),
        ),
      ),
    );
  }
}