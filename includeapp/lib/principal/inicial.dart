//Inicial
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:includeapp/%20funcoes_widgets/funcoes.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';
import 'package:includeapp/configuracoes/perfil.dart';
import 'package:includeapp/principal/mini_jogos.dart';

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
      Perfil(),
      Perfil(),
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
