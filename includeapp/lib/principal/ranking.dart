//Ranking
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:includeapp/%20funcoes_widgets/funcoes.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';
import 'package:includeapp/configuracoes/perfil.dart';
import 'package:includeapp/principal/mini_jogos.dart';

class Ranking extends StatefulWidget {
  const Ranking({super.key});

  @override
  State<Ranking> createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  int selecionado = 0;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final String nomeUsuario = user?.displayName ?? "Usuário";

    final List<Widget> paginas = [
      SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [],
            );
          },
        ),
      ),
      MiniJogos(),
      Perfil(),
      Perfil(),
    ];

    PreferredSizeWidget? appBarExibida;

    if (selecionado == 0) {
      appBarExibida = appBarWidget(context, "Ranking", nomeUsuario);
    } else {
      appBarExibida = null;
    }

    return Scaffold(
      appBar: appBarExibida,
      body: paginas[selecionado],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selecionado,
        onTap: (value) {
          if (value == 4) {
            alertDialogAjuda(context);
          } else {
            setState(() {
              selecionado = value;
            });
          }
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/casa.svg", height: 24),
            label: "Inicial",            
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/controle.svg", height: 24),
            label: "Jogos",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/youtube.svg", height: 28),
            label: "Tutorial",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Perfil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline_rounded, color: Colors.red,),
            label: "Ajuda",
          ),
        ],
      ),
    );
  }
}
