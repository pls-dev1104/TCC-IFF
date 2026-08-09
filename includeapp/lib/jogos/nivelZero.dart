import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';

class NivelZero extends StatefulWidget {
  final String nome;

  const NivelZero({super.key, required this.nome});

  @override
  State<NivelZero> createState() => _NivelZeroState();
}

class _NivelZeroState extends State<NivelZero> {

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