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
      'question': '1- Brasil tem quantas copas do mundo?',
      'image': 'lib/Assets/copa.jpg',
      'options': [
        {'text': '4','pontos': 0}, 
        {'text': '2','pontos': 0}, 
        {'text': '6', 'pontos': 0}, 
        {'text': '5','pontos': 1}
        ],
      },
    {
      'question': '2- Quantos gols tem o maior artilheiro do mundo (gols oficiais) ?',
      'image': 'lib/Assets/artilheiro.jpg',
      'options': [
         {'text': '908','pontos': 1},
         {'text': '798','pontos': 0},
         {'text': '550','pontos': 0},
         {'text': '880','pontos': 0}
         ],
      },
    {
      'question': '3- Em que ano Lionel Messi nasceu?',
      'image': 'lib/Assets/messiquiz.jpg',
      'options': [
        {'text': '1990','pontos': 0}, 
        {'text': '1987','pontos': 1}, 
        {'text': '1980','pontos': 0}, 
        {'text': '1986','pontos': 0}
        ],
      },
    {
      'question': '4- Quantos gols Neymar Jr fez em sua passagem pelo Barcelona?',
      'image': 'lib/Assets/neymarquiz.jpg',
      'options': [
        {'text': '110 gols','pontos': 0},
        {'text': '105 gols','pontos': 1},
        {'text': '150 gols','pontos': 0},
        {'text': '95 gols','pontos': 0},
        ],
      },
    {
      'question': '5-  Qual foi o único time brasileiro que venceu 3 títulos do Brasileirão seguidos na era dos pontos corridos? ?',
      'image': 'lib/Assets/brasileiraoquiz.webp',
      'options': [
        {'text': 'Flamengo (2018,2019,2020)','pontos': 0}, 
        {'text': 'São Paulo (2006,2007,2008)','pontos': 1}, 
        {'text': 'Corithians (2015,2016,2017)','pontos': 0},
        {'text': 'Santos (1961,1962,1963)','pontos': 0},
        ],
      },
    {
      'question': '6- Quem fez o gol do título do Chelsea no mundial de clubes 2021? ',
      'image': 'lib/Assets/mundialquiz.jpg',
      'options': [
        {'text': 'Kai Havertz','pontos': 1},
        {'text': 'Lukaku','pontos': 0},
        {'text': 'Jorginho','pontos': 0},
        {'text': 'Kanté','pontos': 0},
        ],
      },
    {
      'question': '7- Qual é o clube com mais títulos da UEFA Champions League? ',
      'image': 'lib/Assets/championsquiz.webp',
      'options': [
        {'text': 'Manchester United','pontos': 0},
        {'text': 'Bayer de Munich','pontos': 0},
        {'text': 'Barcelona','pontos': 0},
        {'text': 'Real Madrid','pontos': 1},
       ],
      },
    {
      'question': '8- Quem foi o vencedor do prémio "FIFA The Best" do ano de 2020? ',
      'image': 'lib/Assets/fifaquiz.webp',
      'options': [
        {'text': 'Cristiano Ronaldo','pontos': 0}, 
        {'text': 'Lionel Messi','pontos': 0},
        {'text': 'Neymar Jr','pontos': 0}, 
        {'text': 'Robert Lewandowski','pontos': 1},
        ],
      },
    {
      'question': '9- Qual o número mínimo de jogadores em cada time numa partida de futebol?',
      'image': 'lib/Assets/campoquiz.webp',
      'options': [
        {'text': '7','pontos': 1},
        {'text': '8','pontos': 0 },
        {'text': '10','pontos': 0},
        {'text': '11','pontos': 0},
        ],
      },
    {
      'question': '10- Quem é o maior vencedor do prêmio "Ballon dor" organizado pela France Football?',
      'image': 'lib/Assets/bolaquiz.webp',
      'options': [
       {'text': 'Johan Cruijff','pontos': 0},
       {'text': 'Luka Modric','pontos': 0}, 
       {'text': 'Lionel Messi','pontos': 1},  
       {'text': 'Cristiano Ronaldo','pontos': 0},
        ],
      },
    {
      'question': '11- Quem é o maior marcador da história da UEFA Champions League? ',
      'image': 'lib/Assets/quizultimo.jpg',
      'options': [
       {'text': 'Cristiano Ronaldo','pontos': 1}, 
       {'text': 'Karim Benzema','pontos': 0},
       {'text': 'Robert Lewandowski','pontos': 0},
       {'text': 'Lionel Messi','pontos': 0},
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
          Text(
            'Pergunta ${perguntaAtual + 1} de ${perguntas.length}',
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
              ),
          Image.asset(
                  perguntas[perguntaAtual]['image'] as String, 
                  width: 250,
                  height: 400,
        ),
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
            },
            ).toList(),
          ],
        ),
      ):Container(),
    );
  }
}