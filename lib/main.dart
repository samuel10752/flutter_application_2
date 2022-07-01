import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
      print(_perguntaSelecionada);
    });
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [ {
        'texto':'Qual é a sua cor favorita?',
        'repostas':['Preto','Vermelho','Verde','Branco'],
      },{
       'texto': 'Qual é o seu animal favorito?',
       'respostas':['Coelho','Cachorro','Gato','Cavalo',],
      },{
       'texto': 'Qual é o a sua Melhor amiga ?',
       'respostas':['Maria','Daniela','Giovana','Julia',],
      },];
    
    List<String> respostas =
        perguntas[_perguntaSelecionada].cast()['respostas'];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: [
            Questao(perguntas[_perguntaSelecionada]['texto'] as String),
            ...respostas.map((t) => Resposta(t, _responder)).toList(),
          ],
        ),
      ),
    );
  }
}
