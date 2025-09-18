import 'package:desenv_mobile/screens/home_screen.dart';
import 'package:desenv_mobile/screens/produto_list_screen.dart';
import 'package:desenv_mobile/screens/teste_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Produto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      //rota inicial
      initialRoute: '/',
      //listas das rotas e paginas
      getPages: [
        GetPage(name: '/', page: () => MyHomePage(title: 'home')),
        GetPage(name: '/produtos', page: () => ListaProdutos()),
        GetPage(name: '/teste', page: () => MyPageTeste(title: 'teste'))
      ],
    );
  }
}


