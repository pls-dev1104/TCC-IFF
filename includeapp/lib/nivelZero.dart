import 'package:flutter/material.dart';

class NivelZero extends StatefulWidget {
  const NivelZero({super.key});

  @override
  State<NivelZero> createState() => _NivelZeroState();
}

class _NivelZeroState extends State<NivelZero> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Nível 0"),),
    );
  }
}