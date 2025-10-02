import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../components/menu_component.dart';
import '../controllers/loja_controller.dart';
import '../services/loja_service.dart';

class MyPageTeste extends StatefulWidget {
  final controller = Get.put(LojaController(
      service: LojaService()));
  @override
  State<MyPageTeste> createState() => _ListarlojasState();
}

class _ListarlojasState extends State<MyPageTeste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Lista Lojas"),
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
          if(widget.controller.lojas.isEmpty){
            return Center(child: Text('Nenhuma loja encontrado'),);
          }

          return ListView.builder(
              itemCount: widget.controller.lojas.length,
              itemBuilder: (variavel, i){
                final p = widget.controller.lojas[i];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Text('${p.nome}'),
                    subtitle: Text('${p.cnpj} - ${p.endereco} ${p.telefone}'),
                    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.red,)),
                  ),
                );
              });
        })

    );
  }
}