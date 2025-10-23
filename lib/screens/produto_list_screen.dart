import 'package:desenv_mobile/controllers/produto_controller.dart';
import 'package:desenv_mobile/services/produto_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/menu_component.dart';

class ListaProdutos extends StatefulWidget {
  final controller = Get.put(ProdutoController(
      service: ProdutoService()));
  @override
  State<ListaProdutos> createState() => _ListaProdutosState();
}
class _ListaProdutosState extends State<ListaProdutos> {

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
  title: Text("Lista Produtos"),
     ),
      drawer: const MenuComponent(),
      body:
          Obx((){
              if(widget.controller.isLoading.value){
                return Center(child: CircularProgressIndicator(),);
              }
              if(widget.controller.error.isNotEmpty){
                return Center(child: Text('Erro:  ${widget.controller.error}'),);
              }
              if(widget.controller.produtos.isEmpty){
                return Center(child: Text('Nenhum produto encontrado'),);
              }

              return ListView.builder(
                  itemCount: widget.controller.produtos.length,
                  itemBuilder: (variavel, i){
                    final p = widget.controller.produtos[i];
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: ListTile(
                        title: Text('${p.nome} - R\$ ${p.preco.toStringAsFixed(2)}'),
                        subtitle: Text(p.descricao),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(onPressed: (){
                                Get.defaultDialog(
                                    title: "Remover",
                                    middleText: 'Deseja remover o produto ${p.nome}',
                                    textCancel: "Cancelar",
                                    textConfirm: "Confirmar",
                                    onConfirm: (){
                                      widget.controller.remover(p.id!);
                                      Get.back();
                                    }
                                );

                              } , icon: Icon(Icons.delete, color: Colors.red,)),

                              IconButton(onPressed: (){
                                Get.toNamed('/produtoForm', arguments: p);
                              }, icon: Icon(Icons.edit, color: Colors.blue,))
                            ],
                          )
                      ),
                    );
                  });
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Get.toNamed('/produtoForm');
        },
        label: Text('Novo produto'),
        icon: Icon(Icons.add),
        ),
        );
  }
}