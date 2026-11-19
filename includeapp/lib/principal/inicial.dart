//Inicial
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
    final String nomeUsuario = user?.displayName ?? "Usuário";

    final List<Widget> paginas = [
      SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                SizedBox(height: 20),
                Text("Bem-vindo, $nomeUsuario!", style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                )),
              ],
            );
          },
        ),
      ),
      MiniJogos(),
      Tutorial(),
      Perfil(),
      IA()
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
