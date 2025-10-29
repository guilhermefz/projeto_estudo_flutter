import 'package:desenv_mobile/models/produto_model.dart';
import 'package:desenv_mobile/services/produto_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProdutoController extends GetxController{
  final ProdutoService service;

  ProdutoController({required this.service});

  final produtos = <ProdutoModel>[].obs;
  final isLoading = false.obs;
  final error = ''.obs;

  @override
  void onInit(){
    super.onInit();
    listar();
  }

  Future<void> listar() async{
    try{
      isLoading.value = true;
      error.value = '';
      //Busca todos os produtos do serviço e atualiza a lista de forma reativa
      produtos.assignAll(await service.listar());
    }catch(e) {
      error.value = e.toString();
    }finally{
      isLoading.value = false;
    }

  }

  Future<void> remover(String id) async {
    try{
      isLoading.value = true;
      final res = await service.delete(id);
      Get.snackbar('sucesso', res);
      listar();
      //lojas.removeWhere((lojas))=>lojas.id == id); //outra forma de chamar, parecido com o expressão lambda
    }catch(e){
      Get.snackbar('Erro', e.toString());
    }finally{
      isLoading.value = false;
    }
  }

  Future<void> salvar({ String? id, required String nome, required String descricao, required double preco, String? loja}) async {
    try {
      isLoading.value = true;
      if (id == null) {
        await service.salvar(
            ProdutoModel(
                id: id,
                nome: nome,
                descricao: descricao,
                preco: preco,
                lojaId: loja)
        );

        await listar();

        Get.back();
        Get.snackbar('sucesso', 'produto salvo com sucesso',
            backgroundColor: Colors.purple);
        listar();
        }else{
        await service.editar(
          ProdutoModel(id: id, nome: nome, descricao: descricao, preco: preco, lojaId: loja)
        );

            Get.back();
            Get.snackbar('sucesso', 'produto editado com sucesso',
            backgroundColor: Colors.purple);
            listar();

      }
      } catch (e) {
      Get.snackbar('Erro', 'erro ao salvar ou editar');
    } finally {
      isLoading.value = false;
    }
  }

}