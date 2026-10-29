import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart'; // Importa o arquivo de widgets
import 'package:includeapp/jogos/nivel0/etapa1basico.dart';
import 'package:includeapp/jogos/nivel1/etapa1Chamada.dart';
import 'package:includeapp/jogos/nivel10/etapa1bancos.dart';
import 'package:includeapp/jogos/nivel11/etapa1uber.dart';
import 'package:includeapp/jogos/nivel12/etapa1seguranca.dart';
import 'package:includeapp/jogos/nivel2/etapa1Alarme.dart';
import 'package:includeapp/jogos/nivel3/etapa1whatsapp.dart';
import 'package:includeapp/jogos/nivel4/etapa1email.dart';
import 'package:includeapp/jogos/nivel5/etapa1google.dart';
import 'package:includeapp/jogos/nivel6/etapa1youtube.dart';
import 'package:includeapp/jogos/nivel7/etapa1apps.dart';
import 'package:includeapp/jogos/nivel8/etapa1gov.dart';
import 'package:includeapp/jogos/nivel9/etapa1inss.dart';
import 'package:includeapp/principal/inicial.dart';

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
      'tela': const Etapa1basico(),
    },
    {
      'titulo': 'Nível 1',
      'subtitulo': 'Chamadas,Contatos',
      'tela': const Etapa1Chamada(),
    },
    {
      'titulo': 'Nível 2',
      'subtitulo': 'Alarme',
      'tela':const Etapa1Alarme(),
    },
    {
      'titulo': 'Nível 3',
      'subtitulo': 'Whatsapp',
      'tela':const Etapa1whatsapp(),
    },
    {
      'titulo': 'Nível 4',
      'subtitulo': 'Criação de email',
      'tela':const Etapa1email(),
    },
    {
      'titulo': 'Nível 5',
      'subtitulo': 'Login Google/Pesquisar',
      'tela':const Etapa1google(),
    },
    {
      'titulo': 'Nível 6',
      'subtitulo': 'Usar Youtube',
      'tela':const Etapa1youtube(),
    },
    {
      'titulo': 'Nível 7',
      'subtitulo': 'Instalação e desinstalação de apps',
      'tela':const Etapa1apps(),
    },
    {
      'titulo': 'Nível 8',
      'subtitulo': 'GOV',
      'tela':const Etapa1gov(),
    },
    {
      'titulo': 'Nível 9',
      'subtitulo': 'INSS',
      'tela':const Etapa1inss(),
    },
    {
      'titulo': 'Nível 10',
      'subtitulo': 'Bancos',
      'tela':const Etapa1bancos(),
    },
    {
      'titulo': 'Nível 11',
      'subtitulo': 'Uber',
      'tela':const Etapa1uber(),
    },
    {
      'titulo': 'Nível 12',
      'subtitulo': '(Extra), Segurança digital',
      'tela':const Etapa1seguranca(),
    },
    {
      'titulo': 'Voltar',
      'subtitulo': '',
      'tela':const Inicial(),
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