import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';

class Configuracoes extends StatefulWidget {
  final String nome;

  const Configuracoes({super.key, required this.nome});

  @override
  State<Configuracoes> createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      drawer: drawerFazer(context, widget.nome),
    );
  }
}