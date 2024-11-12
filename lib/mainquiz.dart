import 'package:flutter/material.dart';
import 'tela_inicial.dart';
import 'tela_quiz.dart';

void main() => runApp( MeuApp());


class MeuApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App de Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: const Color.fromARGB(255, 212, 28, 4),
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
        home: TelaInicial(),
    );
  }
}

