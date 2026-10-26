import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:includeapp/prelooby/prelobby.dart';
import 'package:includeapp/principal/inicial.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    verificarUsuario();
  }

  Future<void> verificarUsuario() async {
    // Verifica diretamente no Firebase se existe um usuário logado
    final user = FirebaseAuth.instance.currentUser;

    // Um pequeno delay de meio segundo apenas para a animação de carregamento aparecer suavemente
    await Future.delayed(const Duration(milliseconds: 500));

    if (!mounted) return;

    // Se o usuário for nulo (não está logado), vai pro Prelobby. Senão, vai pra tela Inicial.
    if (user == null){
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (_) => const Prelobby()),
      );
    } else {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (_) => const Inicial()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}