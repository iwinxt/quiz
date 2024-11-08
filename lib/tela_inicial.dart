import 'package:flutter/material.dart';
import 'package:flutter_application_1/tela_quiz.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz de Conhecimentos Gerais'),
      ),
      body: Center(  
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             Image.asset('lib/Assets/telainicial.png'),
              SizedBox(height: 20),
              Text(
                'Bem-vindo ao Quiz!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20), 
              ElevatedButton(
                onPressed:(){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> TelaDoQuiz())
                  );
                },
                child: Text(
                  'Iniciar Quiz',
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
