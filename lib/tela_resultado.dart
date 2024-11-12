import 'package:flutter/material.dart';
import  'tela_inicial.dart';

class TelaResultado extends StatelessWidget {
  final int pontos;
  final int totalPerguntas;

  TelaResultado({required this.pontos, required this.totalPerguntas});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado do Quiz'),
      ),
      body: Center(  
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[    
            SizedBox(width: 450, height: 250,
              child: Image.asset(
                'lib/Assets/finalquiz2.jpg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
               Text(
                    'Fim do quiz! Você acertou $pontos de $totalPerguntas questões.',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), 
                  ),
              TextButton(
                onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TelaInicial()));
                },
                child: Text(
                            'Recomeçar',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), ),
                   ),
            ],
          ),
        ),
      ),
    );
  }
}