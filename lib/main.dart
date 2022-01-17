import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:receitas_app/receitas.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const Receitas(),
    );
  }
}
