import 'package:flutter/material.dart';

class Celular extends StatefulWidget {
  const Celular({super.key});

  @override
  State<Celular> createState() => _CelularState();
}

class _CelularState extends State<Celular> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Celular"),),
    );
  }
}