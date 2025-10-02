import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MenuComponent extends StatelessWidget {
  const MenuComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(height: 40),
          ListTile(
            title: const Text('HOME'),
            onTap: () {
              Navigator.pushNamed(context, '/');
              //Get.toNamed('/');
            },
          ),
          ListTile(
            title: const Text('Produtos'),
            onTap: () {
              Get.toNamed('/produtos');
            },
          ),
          ListTile(
            title: const Text('lojas'),
            onTap: () {
              Get.toNamed('/lojas');
            },
          ),
        ],
      ),
    );
  }
}