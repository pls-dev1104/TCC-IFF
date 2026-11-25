import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';
import 'package:includeapp/configuracoes/perfil.dart';
import 'package:includeapp/jogos/nivel1/etapa1Chamada.dart';
import 'package:includeapp/jogos/nivel10/etapa1bancos.dart';
import 'package:includeapp/jogos/nivel11/etapa1uber.dart';
import 'package:includeapp/jogos/nivel12/etapa1seguranca.dart';
import 'package:includeapp/jogos/nivel2/etapa1Alarme.dart';
import 'package:includeapp/jogos/nivel3/etapa1whatsapp.dart';
import 'package:includeapp/jogos/nivel4/etapa1google.dart';
import 'package:includeapp/jogos/nivel5/etapa1email.dart';
import 'package:includeapp/jogos/nivel6/etapa1youtube.dart';
import 'package:includeapp/jogos/nivel7/etapa1apps.dart';
import 'package:includeapp/jogos/nivel8/etapa1gov.dart';
import 'package:includeapp/jogos/nivel9/etapa1inss.dart';
import 'package:includeapp/principal/IA.dart';
import 'package:includeapp/principal/mini_jogos.dart';
import 'package:includeapp/principal/tutorial.dart';

class Inicial extends StatefulWidget {
  const Inicial({super.key});

  @override
  State<Inicial> createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
  final List<Map<String, dynamic>> listaNiveis = [
    {
      'titulo': 'Nível 1',
      'subtitulo': 'Chamadas e Contatos',
      'tela': const Etapa1Chamada(),
    },
    {'titulo': 'Nível 2', 'subtitulo': 'Alarme', 'tela': const Etapa1Alarme()},
    {
      'titulo': 'Nível 3',
      'subtitulo': 'Whatsapp',
      'tela': const Etapa1Whatsapp(),
    },
    {
      'titulo': 'Nível 4',
      'subtitulo': 'Criar conta Google',
      'tela': const Etapa1Google(),
    },
    {
      'titulo': 'Nível 5',
      'subtitulo': 'Login Google/Pesquisar',
      'tela': const Etapa1Email(),
    },
    {
      'titulo': 'Nível 6',
      'subtitulo': 'Usar Youtube',
      'tela': const Etapa1Youtube(),
    },
    {
      'titulo': 'Nível 7',
      'subtitulo': 'Instalação e desinstalação de apps',
      'tela': const Etapa1Apps(),
    },
    {'titulo': 'Nível 8',
     'subtitulo': 'GOV',
     'tela': const Etapa1Gov()},
    {'titulo': 'Nível 9', 'subtitulo': 'INSS', 'tela': const Etapa1Inss()},
    {'titulo': 'Nível 10', 'subtitulo': 'Bancos', 'tela': const Etapa1Bancos()},
    {'titulo': 'Nível 11', 'subtitulo': 'Uber', 'tela': const Etapa1Uber()},
    {
      'titulo': 'Nível 12',
      'subtitulo': '(Extra), Segurança digital',
      'tela': const Etapa1seguranca(),
    },
  ];

  int selecionado = 0;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return const Scaffold(
        body: Center(child: Text("Nenhum usuário logado.")),
      );
    }

    final String nomeUsuario = user.displayName ?? "Usuário";

    // Lista de páginas do BottomNavigationBar
    final List<Widget> paginas = [
      SingleChildScrollView(
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || !snapshot.data!.exists) {
              return const Center(
                child: Text("Dados do usuário não encontrados."),
              );
            }

            var dados = snapshot.data!.data() as Map<String, dynamic>;
            int nivelUsuario = dados['nivel'] ?? 1;
            if (nivelUsuario < 1) nivelUsuario = 1;
            if (nivelUsuario > listaNiveis.length) {
              nivelUsuario = listaNiveis.length;
            }
            final infoNivelAtual = listaNiveis[nivelUsuario - 1];

            return Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Centraliza verticalmente
                children: [
                  const SizedBox(height: 40),
                  Text(
                    'Olá, ${dados['nome']}!',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Seu nível é ${dados['nivel'] ?? 1}',
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 130),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: SizedBox(        
                      width: 350,              
                      height: 300,
                      child: BotaoNivel_Inicial(
                        titulo: infoNivelAtual['titulo'],
                        subtitulo: infoNivelAtual['subtitulo'],
                        aoClicar: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => infoNivelAtual['tela'],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      const MiniJogos(),
      const Tutorial(),
      const Perfil(),
      IA(nomeUsuario: nomeUsuario),
    ];

    PreferredSizeWidget? appBarExibida;

    if (selecionado == 0) {
      appBarExibida = appBarWidget(context, "Inicial", nomeUsuario);
    } else {
      appBarExibida = null;
    }

    return Scaffold(
      appBar: appBarExibida,
      body: paginas[selecionado],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selecionado,
        type: BottomNavigationBarType.fixed,
        onTap: (indice) {
          setState(() {
            selecionado = indice;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/casa.svg", height: 26),
            label: "Inicial",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/controle.svg", height: 26),
            label: "Jogos",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/video.svg", height: 32),
            label: "Tutorial",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/perfil.svg", height: 26),
            label: "Perfil",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/robo.svg", height: 30),
            label: "Dúvidas?",
          ),
        ],
      ),
    );
  }
}
