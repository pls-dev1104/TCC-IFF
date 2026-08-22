import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';

class Etapa2Chamada extends StatefulWidget {
  final String nome;

  const Etapa2Chamada({super.key, required this.nome});

  @override
  State<Etapa2Chamada> createState() => _Etapa2ChamadaState();
}

class _Etapa2ChamadaState extends State<Etapa2Chamada> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, "Nível 2", widget.nome),
      drawer: drawerFazer(context, widget.nome),
    );
  }
}