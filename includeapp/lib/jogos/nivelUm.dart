import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';

class NivelUm extends StatefulWidget {
  final String nome;

  const NivelUm({super.key, required this.nome});

  @override
  State<NivelUm> createState() => _NivelUmState();
}

class _NivelUmState extends State<NivelUm> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, "Nível 1", widget.nome),
      drawer: drawerFazer(context, widget.nome),
    );
  }
}