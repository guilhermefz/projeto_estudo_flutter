import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/menu_component.dart';

class MyPageTeste extends StatefulWidget {
  const MyPageTeste({super.key, required this.title});

  final String title;

  @override
  State<MyPageTeste> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyPageTeste> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      drawer: const MenuComponent(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Uma pagina para testar',
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}