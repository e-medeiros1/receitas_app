import 'package:flutter/material.dart';

class Receitas extends StatefulWidget {
  const Receitas({Key? key}) : super(key: key);

  @override
  _ReceitasState createState() => _ReceitasState();
}

class _ReceitasState extends State<Receitas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vamos cozinhar?'),
      ),
      body: const Center(child: Text('Navegar é preciso!')),
    );
  }
}
