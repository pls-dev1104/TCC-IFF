import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';

class Configurancoes extends StatefulWidget {
  final String nome;

  const Configurancoes({super.key, required this.nome});

  @override
  State<Configurancoes> createState() => _ConfigurancoesState();
}

class _ConfigurancoesState extends State<Configurancoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, "Configurações", widget.nome),
      drawer: drawerFazer(context, widget.nome),
    );
  }
}