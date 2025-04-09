import 'package:flutter/material.dart';

void main(){
  runApp(myApp());
}
//  StatelessWidget não muda estado
//  StatefulWidget muda o estado
//  setState tem a função anônima: (() {         }) e muda o estado dos elementos;
class myApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<myApp>{
  final List<Map<String, dynamic>> perguntas = [ //São as perguntas
    {
      'pergunta': 'Qual a capital do Brasil?',
      'opcoes': ['São Paulo', 'Brasília', 'Rio de janeiro'],
      'respostaCorreta': 'Brasília' 
    }
  ];
  int perguntaAtual = 0; //inicializa os valores do quiz
  int pontos = 0;
  String? mensagem;
  bool quizFinalizado = false;

  // funçao que verifica as respostas
  void verificarResposta(String respostaEscolhida){
    String respostaCorreta = perguntas[perguntaAtual]['respostaCorreta'];

    setState(() {
      if (respostaEscolhida == respostaCorreta){
      pontos++;
        mensagem = "Resposta Certa! +1";
      } else {
        mensagem = "Resposta Errada!";
      }
    });
  }
  // espera 2 segundos para proxima pergunta
  Future.delayed(Duration(seconds : 2)), (){
    setState(() {
      mensagem = null;
      if (perguntaAtual < perguntas.length - 1){
        perguntaAtual++
      } else {
        quizFinalizado = true;
      } //avança para proxima se for menor que a lista toda
    }); 
  }

  //metodo para reiniciar o quiz
  void reiniciarQuiz(){
    setState(() {
      perguntaAtual = 0;
      pontos = 0;
      quizFinalizado = false;
      mensagem = null;
    });
  }

}
  @override
  Widget build(BuildContext contex){
    return MaterialApp(
      theme: ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Johne + Laura = <3")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text(texto, 
                style: TextStyle(
                 fontSize: 30, 
                 color: Colors.blue)
              ),
              SizedBox(height: 50),
              ElevatedButton(onPressed: alterarTexto, child: Text('Aperte-me'))
            ],
          ),
        ),
      )
    );
  }
}