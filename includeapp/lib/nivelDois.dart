import 'package:flutter/material.dart';

class NivelDois extends StatefulWidget {
  const NivelDois({super.key});

  @override
  State<NivelDois> createState() => _NivelDoisState();
}

class _NivelDoisState extends State<NivelDois> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: const Text("Nível 2"),),
    );
  }
}