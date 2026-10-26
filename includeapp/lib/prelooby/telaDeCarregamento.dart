import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:includeapp/principal/inicial.dart';

class TelaDeCarregamento extends StatefulWidget {
  const TelaDeCarregamento({super.key});

  @override
  State<TelaDeCarregamento> createState() => _TelaDeCarregamentoState();
}

class _TelaDeCarregamentoState extends State<TelaDeCarregamento> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (context) => Inicial()), //Pedro, coloca o caminho correto aqui
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela de Carregamento", style: TextStyle(color: Colors.white),), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  CircularProgressIndicator(strokeAlign: 15, strokeWidth: 5),

                  SizedBox(height: 60),

                  Text("Carregando...", style: TextStyle(fontSize: 25),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}