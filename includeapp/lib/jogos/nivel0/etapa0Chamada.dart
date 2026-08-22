import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';

class Etapa0Chamada extends StatefulWidget {
  final String nome;

  const Etapa0Chamada({super.key, required this.nome});

  @override
  State<Etapa0Chamada> createState() => _Etapa0ChamadaState();
}

class _Etapa0ChamadaState extends State<Etapa0Chamada> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, "Nível 0", widget.nome),
      drawer: drawerFazer(context, widget.nome),
    );
  }
}