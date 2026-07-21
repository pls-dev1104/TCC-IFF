import 'package:flutter/material.dart';

class NivelUm extends StatefulWidget {
  const NivelUm({super.key});

  @override
  State<NivelUm> createState() => _NivelUmState();
}

class _NivelUmState extends State<NivelUm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Nível 1"),),
    );
  }
}