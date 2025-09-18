import 'package:flutter/material.dart';

import '../components/menu_component.dart';

class ListaProdutos extends StatelessWidget {
  const ListaProdutos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context)
            .colorScheme
            .inversePrimary,

        title: const Text('Listagem de Produtos'),

        titleTextStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),

        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: const MenuComponent(),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Lista Produtos',
            ),
            Text(
              'Este é um teste',
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}