import 'package:desenv_mobile/models/loja_model.dart';
import 'package:desenv_mobile/services/loja_service.dart';
import 'package:get/get.dart';

class LojaController extends GetxController{
  final LojaService service;

  LojaController({required this.service});

  final lojas = <LojaModel>[].obs;
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
      lojas.assignAll(await service.listar());
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

}