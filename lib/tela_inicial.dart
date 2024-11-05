import 'package:flutter/material.dart';



class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz de Conhecimentos Gerais'),
      ),
      body: Center(  // Adiciona Center para centralizar todo o conteúdo
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5zpAOmm7gIsVCGSgYa78kDIBiOnMB7JGVuA&s',
                height: 200,
              ),
              SizedBox(height: 20), // Espaço entre a imagem e o texto
              Text(
                'Bem-vindo ao Quiz!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20), // Espaço entre o texto e o botão
              ElevatedButton(
                onPressed:(){
                  print('Quiz Iniciado');
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
