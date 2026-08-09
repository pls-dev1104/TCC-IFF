import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';

class NivelDois extends StatefulWidget {
  final String nome;

  const NivelDois({super.key, required this.nome});

  @override
  State<NivelDois> createState() => _NivelDoisState();
}

class _NivelDoisState extends State<NivelDois> {

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