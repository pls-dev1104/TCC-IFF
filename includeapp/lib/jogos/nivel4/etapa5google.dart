import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';
import 'package:includeapp/jogos/nivel4/etapa6google.dart';

class Etapa5Google extends StatefulWidget {

  const Etapa5Google({super.key});

  @override
  State<Etapa5Google> createState() => _Etapa5Google();
}

class _Etapa5Google extends State<Etapa5Google> {
  final AudioPlayer tocar = AudioPlayer();

  bool botao1 = false;
  bool botao2 = false;
  bool botao3 = false;
  bool botao4 = false;

  bool escolhaCerta1 = false;
  bool escolhaCerta2 = true;
  bool escolhaCerta3 = false;
  bool escolhaCerta4 = false;

  final imagem = "assets/imagem/jogosImagem/level1/telaInicialChamada.jpg";
  final pergunta = "Onde eu aperto para criar minha senha?";
  final opcao1 = Text("Mostrar senha", style: TextStyle(fontSize: 18),);
  final opcao2 = Text("Senha", style: TextStyle(fontSize: 20),);
  final opcao3 = Text("Crie uma senha", style: TextStyle(fontSize: 16),);
  final opcao4 = Text("Avançar", style: TextStyle(fontSize: 20),);

  void somAcerto() async {
    await tocar.stop();
    await tocar.play(AssetSource("som/acerto.mp3"), mode: PlayerMode.lowLatency);
  }

  void somErro() async {
    await tocar.stop();
    await tocar.play(AssetSource("som/erro.mp3"), mode: PlayerMode.lowLatency);
  }

  void erro1() {
    setState(() {
      botao1 = true;
    });
  }

  void erro2() {
    setState(() {
      botao2 = true;
    });
  }

  void erro3() {
    setState(() {
      botao3 = true;
    });
  }

  void erro4() {
    setState(() {
      botao4 = true;
    });
  }

  @override
  void initState() {
    super.initState();
    AudioCache().load('som/acerto.mp3');
    AudioCache().load('som/erro.mp3');
  }

  @override
  void dispose() {
    tocar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidgetMiniJogo(context, "Fase 5", etapaAtual: 5, totalEtapas: 7),
      body: Center(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final telaWidth = MediaQuery.of(context).size.width;

              final telaPC = telaWidth > 600;
              final double imagemTela;
              final int cacheImagemTela;

              if (telaPC) {
                imagemTela = telaWidth * 0.125;
                cacheImagemTela = 400;
              } else {
                imagemTela = telaWidth * 0.60;
                cacheImagemTela = 900;
              }

              return padronizacaoJogo(context, imagem, pergunta, (context) => Etapa6Google(), imagemTela, cacheImagemTela, telaPC, botao1, botao2, botao3, botao4, escolhaCerta1, escolhaCerta2, escolhaCerta3, escolhaCerta4, somAcerto, somErro, erro1, erro2, erro3, erro4, opcao1, opcao2, opcao3, opcao4);
            },
          ),
        )
      ), 
    );
  }
}