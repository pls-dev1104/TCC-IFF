import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';
import 'package:includeapp/configuracoes/perfil.dart';
import 'package:includeapp/principal/IA.dart';
import 'package:includeapp/principal/mini_jogos.dart';
import 'package:includeapp/principal/tutorial.dart';

class Inicial extends StatefulWidget {
  const Inicial({super.key});

  @override
  State<Inicial> createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
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
              return const Center(child: Text("Dados do usuário não encontrados."));
            }
            var dados = snapshot.data!.data() as Map<String, dynamic>;          
            return Center(child:  Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  'Olá, ${dados['nome']}!',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
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