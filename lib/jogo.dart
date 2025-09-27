import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("assets/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(opcoes.length);
    var escolhaApp = opcoes[numero];

    //Exibução da imagem escolhida pelo Ap
    switch (escolhaApp) {
      case "pedra":
        setState(() {
          _imagemApp = AssetImage("assets/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imagemApp = AssetImage("assets/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imagemApp = AssetImage("assets/tesoura.png");
        });
        break;
    }

    //Validação do ganhador
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel")) {
        setState(() {
           _mensagem = "PARABÉNS! Você ganhou!";
        });
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel")) {
          setState(() {
            _mensagem = "Você Perdeu!";
          });
      
    } else{
      setState(() {
        _mensagem = "Empatamos";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "JoKenPo",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(
            image: _imagemApp,
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Escolha uma opção abaixo",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset(
                  "assets/pedra.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset(
                  "assets/papel.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset(
                  "assets/tesoura.png",
                  height: 100,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
