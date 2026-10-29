import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart'; // Importa o arquivo de widgets
import 'package:includeapp/jogos/nivel0/etapa0Chamada.dart';
import 'package:includeapp/jogos/nivel1/etapa1Chamada.dart';
import 'package:includeapp/jogos/nivel2/etapa1Alarme.dart';

class MiniJogos extends StatefulWidget {
  const MiniJogos({super.key});

  @override
  State<MiniJogos> createState() => _MiniJogosState();
}

class _MiniJogosState extends State<MiniJogos> {
  final List<Map<String, dynamic>> listaNiveis = [
    {
      'titulo': 'Nível 0',
      'subtitulo': 'Apps básicos do celular',
      'tela': const Etapa0Chamada(),
    },
    {
      'titulo': 'Nível 1',
      'subtitulo': 'Apps básicos do celular',
      'tela': const Etapa1Chamada(),
    },
    {
      'titulo': 'Nível 2',
      'subtitulo': 'Apps básicos do celular',
      'tela': const Etapa1Alarme(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final String nomeUsuario = user?.displayName ?? "Usuário";

    return Scaffold(
      appBar: appBarWidget(context, "Níveis", nomeUsuario),
      drawer: drawerFazer(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(20),
          ),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 1.0,
            ),
            
            itemCount: listaNiveis.length,
            itemBuilder: (context, index) {
              final nivelAtual = listaNiveis[index];
              return BotaoNivel(
                titulo: nivelAtual['titulo'],
                subtitulo: nivelAtual['subtitulo'],
                aoClicar: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => nivelAtual['tela'],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}