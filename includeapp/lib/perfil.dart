import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';

class Perfil extends StatefulWidget {
  final String nome;

  const Perfil({super.key, required this.nome});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, "Perfil", widget.nome),
      drawer: drawerFazer(context, widget.nome),
    );
  }
}