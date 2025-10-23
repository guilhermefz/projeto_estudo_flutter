import 'package:desenv_mobile/models/produto_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/material.dart';
import '../components/menu_component.dart';
import '../controllers/loja_controller.dart';
import '../controllers/produto_controller.dart';
import '../services/produto_service.dart';


class ProdutoFormScreen extends StatefulWidget {

  @override
  State<ProdutoFormScreen> createState() => _FormProdutoState();
}
class _FormProdutoState extends State<ProdutoFormScreen> {
  final controller = Get.find<ProdutoController>();
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _precoController = TextEditingController();
  String? id;

  final lojaController =  Get.find<LojaController>();
  final _formKey = GlobalKey<FormState>();
  String? _lojaId;

  @override
  void  initState(){
    super.initState();
    final arg = Get.arguments;
    if(arg != null && arg is ProdutoModel){
      id = arg.id;
      _nomeController.text = arg.nome;
      _descricaoController.text = arg.descricao;
      _precoController.text = arg.preco.toString();
      _lojaId = arg.lojaId;

      if(lojaController.lojas.isEmpty){
        lojaController.listar();
      }

    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Produto'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: MenuComponent(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome do Produto'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descricaoController,
                decoration: InputDecoration(labelText: 'Descrição'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _precoController,
                decoration: InputDecoration(labelText: 'Preço'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  try {
                    double.parse(value);
                  } catch (e) {
                    return 'Valor inválido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),

              Obx((){
                if(lojaController.isLoading.value){
                  return LinearProgressIndicator();
                }
                final lojasUnicas = { for (var l in lojaController.lojas) l.id : l };
                final items = lojasUnicas.values.map((l) => DropdownMenuItem<String>(
                  value: l.id,
                  child: Text('${l.nome}'),
                )).toList();

                final valorValido = lojasUnicas.containsKey(_lojaId) ? _lojaId : null;

                if(items.isEmpty){
                  return InputDecorator(
                    decoration: InputDecoration(labelText: 'Loja', border: OutlineInputBorder()),
                    child: Text('Nenhum loja encontrada'),
                  );
                }
                return DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Loja', border: OutlineInputBorder()),
                  value: valorValido,
                  items: items,
                  onChanged: (v) => setState(() => _lojaId = v),
                  validator: (v) => (v == null || v.isEmpty) ? 'Selecione uma loja' : null,
                );
              }),

              Obx(() => ElevatedButton.icon(
                onPressed:
                controller.isLoading.value ? null
                    :(){
                  if(_formKey.currentState!.validate()){
                    controller.salvar(
                      id: id,
                      nome: _nomeController.text,
                      descricao: _descricaoController.text,
                      preco: double.tryParse(_precoController.text) ?? 0.0,
                      loja: _lojaId!,
                    );
                  }
                },
                icon: Icon(Icons.save),
                label: Text(
                    controller.isLoading.value ? 'Salvando...': 'Salvar'
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}