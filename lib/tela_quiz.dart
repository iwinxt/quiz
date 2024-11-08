import 'package:flutter/material.dart';
import 'tela_resultado.dart';

class TelaDoQuiz extends StatefulWidget {
  @override
  _TelaDoQuizState createState() => _TelaDoQuizState();
}

class _TelaDoQuizState extends State<TelaDoQuiz> {
  int perguntaAtual = 0;
  int pontos = 0;

  final List<Map<String, Object>> perguntas = [
    {
      'question': 'Qual é a capital do Brasil?',
      'options': [
        {'text': 'Rio de Janeiro','pontos': 0}, 
        {'text': 'Brasília','pontos': 1}, 
        {'text': 'São Paulo', 'pontos': 0}, 
        {'text':'Salvador','pontos': 0}
        ],
      },
    {
      'question': 'Qual é o maior país do mundo?',
      'options': [
         {'text': 'Rússia','pontos': 1},
         {'text':'Brasil','pontos': 0},
         {'text':'Estados Unidos','pontos': 0},
         {'text':'Vaticano','pontos': 0}
         ],
      },
    {
      'question': 'Normalmente, quantos litros de sangue uma pessoa tem?',
      'options': [
        {'text':'2 a 4 litros','pontos': 0}, 
        {'text':'4 a 6 litros','pontos': 1}, 
        {'text':'10 litros','pontos': 0}, 
        {'text':'7 litros','pontos': 0}
        ],
      },
    {
      'question': ' De onde é a invenção do chuveiro elétrico?',
      'options': [
        {'text':'França','pontos': 0},
        {'text': 'Brasil','pontos': 1},
        {'text': 'Inglaterra','pontos': 0},
        {'text': 'Itália','pontos': 0},
        ],
      },
    {
      'question': 'Quantas casas decimais tem o número pi?',
      'options': [
        {'text':'Centenas','pontos': 0}, 
        {'text':'Infinitas','pontos': 1}, 
        {'text':'Milhares','pontos': 0},
        {'text':'Vinte','pontos': 0},
        ],
      },
    {
      'question': 'Quantos ossos tem no corpo humano?',
      'options': [
        {'text':'206','pontos': 1},
        {'text': '200','pontos': 0},
        {'text': '190','pontos': 0},
        {'text': '220','pontos': 0},
        ],
      },
    {
      'question': 'Onde os animes foram criados?',
      'options': [
        {'text':'Brasil','pontos': 0},
        {'text':'Coreia','pontos': 0},
        {'text':'China','pontos': 0},
        {'text': 'Japão','pontos': 1},
       ],
      },
    {
      'question': 'O que a palavra legend significa em português?',
      'options': [
        {'text':'Legenda','pontos': 0}, 
        {'text': 'Conto','pontos': 0},
        {'text':'História','pontos': 0}, 
        {'text': 'Lenda','pontos': 1},
        ],
      },
    {
      'question': 'Qual o número mínimo de jogadores em cada time numa partida de futebol?',
      'options': [
        {'text':'7','pontos': 1},
        {'text':'8','pontos': 0 },
        {'text':'10','pontos': 0},
        {'text':'11','pontos': 0},
        ],
      },
    {
      'question': 'Quanto tempo a luz do Sol demora para chegar à Terra?',
      'options': [
       {'text': '12 minutos','pontos': 0},
       {'text': '12 horas','pontos': 0}, 
       {'text': '8 minutos','pontos': 1},  
       {'text':' 1 dia','pontos': 0},
        ],
      },
    {
      'question': '10+12 = 22?',
      'options': [
       {'text': 'Verdadeiro','pontos': 1}, 
       {'text':'Falso','pontos': 0},
       ],
    },
  ];

  void verificarRespostas(int pontoCerto) {
    setState(() {
      pontos += pontoCerto;
      perguntaAtual++;
    });

    
    if (perguntaAtual == perguntas.length) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TelaResultado(pontos: pontos, totalPerguntas: perguntas.length),
        ),
      );
    }
  }

  void resetQuiz() {
  setState(() {
    perguntaAtual = 0;
    pontos = 0;
  });
}


@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Quiz')),
    body:perguntaAtual < perguntas.length? 
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset('lib/Assets/telaquiz.jpg',height: 200,),
          Text(
            perguntas[perguntaAtual]['question'] as String,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),  
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          ...(perguntas[perguntaAtual]['options'] as List<Map<String, Object>>).map(
            (option) {
            return ElevatedButton(
              onPressed: () => verificarRespostas(option['pontos']as int),
               style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),    
              ),
              child: Text(option['text'] as String, style: TextStyle(fontSize: 20)
                ),
              );
            }).toList(),
          ],
        ),
      ):Container(),
    );
  }
}