import 'package:flutter/material.dart';

class Computador extends StatefulWidget {
  const Computador({super.key});

  @override
  State<Computador> createState() => _ComputadorState();
}

class _ComputadorState extends State<Computador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Computador"),),
    );
  }
}