import 'package:flutter/material.dart';
import 'package:includeapp/configurancoes.dart';
import 'package:includeapp/perfil.dart';
import 'package:includeapp/%20funcoes_widgets/funcoes.dart';
import 'package:includeapp/inicial.dart';

Widget drawerFazer(BuildContext context, String nome) {
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
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Inicial(nome: nome)));
          },
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
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Configurancoes(nome: nome)));
          },
        ),
      ],
    ),
  );
}

// ===

PreferredSizeWidget appBarWidget(BuildContext context, String titulo, String nome) {
  return AppBar(
    centerTitle: true, title: Text(titulo, style: TextStyle(color: Colors.white),),
    iconTheme: IconThemeData(
      color: Colors.white
    ),
    actions: [
        Row(
          children: [
            IconButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2563EB),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Perfil(nome: nome)));
              },
              icon: Icon(Icons.account_circle, color: Colors.white, size: 24), 
              )
          ],              
        ),    
      SizedBox(width: 10),
    ],
  );
}

// ===