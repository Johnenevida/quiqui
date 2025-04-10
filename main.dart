// import 'package:flutter/material.dart';

// void main(){
//   runApp(MyApp());
// }
// //  StatelessWidget não muda estado
// //  StatefulWidget muda o estado
// //  setState tem a função anônima: (() {         }) e muda o estado dos elementos;
// class MyApp extends StatefulWidget{
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp>{
//   final List<Map<String, dynamic>> perguntas = [ //São as perguntas
//     {
//       'pergunta': 'Qual a capital do Brasil?',
//       'opcoes': ['São Paulo', 'Brasília', 'Rio de Janeiro'],
//       'respostaCorreta': 'Brasília' 
//     }
//   ];
//   int perguntaAtual = 0; //inicializa os valores do quiz
//   int pontos = 0;
//   String? mensagem;
//   bool quizFinalizado = false;

//   // funçao que verifica as respostas
//   void verificarResposta(String respostaEscolhida){
//     String respostaCorreta = perguntas[perguntaAtual]['respostaCorreta'];

//     setState(() {
//       if (respostaEscolhida == respostaCorreta){
//       pontos++;
//         mensagem = "Resposta Certa! +1";
//       } else {
//         mensagem = "Resposta Errada!";
//       }
//     });

//     // espera 2 segundos para proxima pergunta
//     Future.delayed(Duration(seconds : 2), (){
//     setState(() {
//       mensagem = null;
//       if (perguntaAtual < perguntas.length - 1){
//         perguntaAtual++;
//       } else {
//         quizFinalizado = true;
//       } //avança para proxima se for menor que a lista toda
//     }); 
//     });
//   }
  
//   //metodo para reiniciar o quiz
//   void reiniciarQuiz(){
//     setState(() {
//       perguntaAtual = 0;
//       pontos = 0;
//       quizFinalizado = false;
//       mensagem = null;
//     });
//   }
//  @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       theme: ThemeData.dark(),
//       darkTheme: ThemeData.dark(),
//       home: Scaffold(
//         appBar: AppBar(
//         title: Text("Quiz Pokemon")),
//         body: Center(
//           child: quizFinalizado ? Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Parabéns! , você terminou o quiz",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 24)
//               ),
//               SizedBox( height: 20),
//               Text(
//                 "Sua pontuação: $pontos/${perguntas.length}"
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: reiniciarQuiz, child: Text('Recomeçar'))
//             ],
//           ) : Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.network("https://cdn-icons-png.flaticon.com/512/188/188987.png", width: 100, height: 100),
//               SizedBox(height: 20),
//               Text(
//                 perguntas[perguntaAtual]["pergunta"],
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 20),
//               ...perguntas[perguntaAtual]["opcoes"].map<Widget>((opcao){
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 4.0),
//                   child: ElevatedButton(
//                     onPressed: mensagem == null ? () => verificarResposta(opcao) : null,
//                     child: Text(opcao)
//                     )
//                 );
//               }).toList(),
//               SizedBox(height: 20),
//               if (mensagem != null)
//                 Text(mensagem!),
//                 SizedBox(height: 20),
//                 Text('Pontuação: $pontos')
//             ],
//           )
//         ),
//       )
//     );
//   }
// }

 import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Map<String, dynamic>> perguntas = [
    {
      'pergunta': 'Qual a capital do Brasil?',
      'opcoes': ['São Paulo', 'Brasília', 'Rio de Janeiro'],
      'respostaCorreta': 'Brasília'
    },
    {
      'pergunta': 'Qual é o Pokémon número #001 da Pokédex?',
      'opcoes': ['Bulbasaur', 'Charmander', 'Pikachu'],
      'respostaCorreta': 'Bulbasaur',
      'imagem': 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png'
    },
    {
      'pergunta': 'Qual tipo do Pikachu?',
      'opcoes': ['Água', 'Fogo', 'Elétrico'],
      'respostaCorreta': 'Elétrico',
      'imagem': 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png'
    },
    {
      'pergunta': 'Qual evolução do Charmander?',
      'opcoes': ['Charmeleon', 'Charizard', 'Charjabug'],
      'respostaCorreta': 'Charmeleon',
      'imagem': 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/004.png'
    },
    {
      'pergunta': 'Qual é o tipo principal do Squirtle?',
      'opcoes': ['Elétrico', 'Fogo', 'Água'],
      'respostaCorreta': 'Água',
      'imagem': 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/007.png'
    },
    {
      'pergunta': 'Qual desses Pokémon é do tipo Planta?',
      'opcoes': ['Oddish', 'Growlithe', 'Onix'],
      'respostaCorreta': 'Oddish',
      'imagem': 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/043.png'
    },
    {
      'pergunta': 'Quem é conhecido como o Pokémon Lendário do Tempo?',
      'opcoes': ['Palkia', 'Dialga', 'Arceus'],
      'respostaCorreta': 'Dialga',
      'imagem': 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/483.png'
    },
    {
      'pergunta': 'Qual é o tipo do Gengar?',
      'opcoes': ['Fantasma/Veneno', 'Sombrio/Fantasma', 'Veneno/Psíquico'],
      'respostaCorreta': 'Fantasma/Veneno',
      'imagem': 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/094.png'
    },
    {
      'pergunta': 'Qual é a evolução do Eevee para o tipo Fogo?',
      'opcoes': ['Jolteon', 'Vaporeon', 'Flareon'],
      'respostaCorreta': 'Flareon',
      'imagem': 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/136.png'
    },
    {
      'pergunta': 'Qual é o lendário que representa o céu e é verde?',
      'opcoes': ['Rayquaza', 'Kyogre', 'Groudon'],
      'respostaCorreta': 'Rayquaza',
      'imagem': 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/384.png'
    },
  ];

  int perguntaAtual = 0;
  int pontos = 0;
  String? mensagem;
  bool quizFinalizado = false;

  void verificarResposta(String respostaEscolhida) {
    String respostaCorreta = perguntas[perguntaAtual]['respostaCorreta'];

    setState(() {
      if (respostaEscolhida == respostaCorreta) {
        pontos++;
        mensagem = "Resposta Certa! +1";
      } else {
        mensagem = "Resposta Errada!";
      }
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        mensagem = null;
        if (perguntaAtual < perguntas.length - 1) {
          perguntaAtual++;
        } else {
          quizFinalizado = true;
        }
      });
    });
  }

  void reiniciarQuiz() {
    setState(() {
      perguntaAtual = 0;
      pontos = 0;
      quizFinalizado = false;
      mensagem = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final perguntaAtualData = perguntas[perguntaAtual];
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text("Quiz Pokémon")),
        body: Center(
          child: quizFinalizado
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Parabéns! Você terminou o quiz",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(height: 20),
                    Text("Sua pontuação: $pontos/${perguntas.length}"),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: reiniciarQuiz,
                      child: Text('Recomeçar'),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (perguntaAtualData.containsKey('imagem'))
                      Image.network(
                        perguntaAtualData['imagem'],
                        width: 100,
                        height: 100,
                      )
                    else
                      Image.network(
                        "https://cdn-icons-png.flaticon.com/512/188/188987.png",
                        width: 100,
                        height: 100,
                      ),
                    SizedBox(height: 20),
                    Text(
                      perguntaAtualData["pergunta"],
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    ...perguntaAtualData["opcoes"].map<Widget>((opcao) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: ElevatedButton(
                          onPressed: mensagem == null
                              ? () => verificarResposta(opcao)
                              : null,
                          child: Text(opcao),
                        ),
                      );
                    }).toList(),
                    SizedBox(height: 20),
                    if (mensagem != null) ...[
                      Text(
                        mensagem!,
                        style: TextStyle(
                          color: mensagem == "Resposta Certa! +1"
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                    Text('Pontuação: $pontos'),
                  ],
                ),
        ),
      ),
    );
  }
}
