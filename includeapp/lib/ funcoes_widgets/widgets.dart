import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/funcoes.dart';

Widget drawerFazer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Color(0xFF2563EB),
          ),
          child: Text("Atalhos", 
            style: TextStyle(
              color: Colors.white,
              fontSize: 26
            ),
          )
        ),

        ListTile(
          title: Text("Início", style: 
            TextStyle(
              fontSize: 20
            ),
          ),
        ),

        ListTile(
          title: Text("Mini-jogos", style: 
            TextStyle(
              fontSize: 20
            ),
          ),
        ),

        ListTile(
          title: Text("Ajuda", style: 
            TextStyle(
              fontSize: 20
            ),
          ),
          onTap: () {
            alertDialogAjuda(context);
          },
        ),

        ListTile(
          title: Text("Configurações", style: 
            TextStyle(
              fontSize: 20
            ),
          ),
        ),
      ],
    ),
  );
}

// ===