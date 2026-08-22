import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';

class Etapa2Chamada extends StatefulWidget {
  final String nome;

  const Etapa2Chamada({super.key, required this.nome});

  @override
  State<Etapa2Chamada> createState() => _Etapa2ChamadaState();
}

class _Etapa2ChamadaState extends State<Etapa2Chamada> {
  bool botao1 = false;
  bool botao2 = false;
  bool botao3 = false;
  bool botao4 = false;

  bool escolhaCerta1 = false;
  bool escolhaCerta2 = false;
  bool escolhaCerta3 = false;
  bool escolhaCerta4 = true;

  final imagem = "assets/imagem/jogosImagem/level1/telaDiscarNumero.jpg";
  final pergunta = "Depois de digitar o nome completo,\n qual botão devo apertar para realizar a chamada?";
  final opcao1 = Icon(Icons.grid_3x3, size: 30);
  final opcao2 = Icon(Icons.backspace_outlined, size: 30);
  final opcao3 = Icon(Icons.home_filled, size: 30);
  final opcao4 = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.call, size: 25,),
      SizedBox(width: 5,),
      Text("Ligar", style: TextStyle(fontSize: 25),)
    ],
  );


  void Erro1() {
    setState(() {
      botao1 = true;
    });
  }

  void Erro2() {
    setState(() {
      botao2 = true;
    });
  }

  void Erro3() {
    setState(() {
      botao3 = true;
    });
  }

  void Erro4() {
    setState(() {
      botao4 = true;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, "Etapa 2", widget.nome),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final telaWidth = MediaQuery.of(context).size.width;
            final telaHeigth = MediaQuery.of(context).size.height;

            return padronizacaoJogo(context, widget.nome, imagem, pergunta, (context) => Etapa2Chamada(nome: widget.nome), telaWidth, telaHeigth, botao1, botao2, botao3, botao4, escolhaCerta1, escolhaCerta2, escolhaCerta3, escolhaCerta4, Erro1, Erro2, Erro3, Erro4, opcao1, opcao2, opcao3, opcao4);
          },
        ),
      ),
    );
  }
}