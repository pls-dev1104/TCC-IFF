import 'package:flutter/material.dart';

class TelaCarregamento extends StatefulWidget {
  final String nome;
  final Widget proximaTelaNivel; //Lobato, parâmetro pra já passar pra tela dos níveis, é widget pq está referenciando o NivelZero, NivelUm e o NívelDois, que são widgets

  const TelaCarregamento({super.key, required this.nome, required this.proximaTelaNivel});

  @override
  State<TelaCarregamento> createState() => _TelaCarregamentoState();
}

class _TelaCarregamentoState extends State<TelaCarregamento> {
  @override
  void initState() {
    super.initState();
    carregamento();
  }

  Future<void> carregamento() async {
    await Future.delayed(Duration(seconds: 2));

    if (!context.mounted) return;

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget.proximaTelaNivel));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carregamento", style: TextStyle(color: Colors.white),), 
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {

          final telaWidth = MediaQuery.of(context).size.width;
          final telaHeight = MediaQuery.of(context).size.height;
          final telaPC = telaWidth > 600;

          final double gapSuperior;

          if (telaPC) {
            gapSuperior = telaHeight * 0.40;
          } else {
            gapSuperior = telaHeight * 0.275;
          }

          return Center(
            child: Column(
              children: [
                SizedBox(height: gapSuperior),

                SizedBox(
                  width: 90,
                  height: 90,
                  child: CircularProgressIndicator(
                    strokeWidth: 6,
                    color: Colors.blueAccent,
                  ),
                ),

                SizedBox(height: 40),

                Text("Carregando...", style: TextStyle(
                  fontSize: 20
                ),)
              ],
            ),
          );
        },
      ),
    );
  }
}