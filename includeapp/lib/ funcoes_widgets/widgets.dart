import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/configura%C3%A7%C3%B5es.dart';
import 'package:includeapp/%20funcoes_widgets/funcoes.dart';
import 'package:includeapp/inicial.dart';
import "package:includeapp/nivelUm.dart";

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
            Navigator.push(context, MaterialPageRoute(builder: (context) => Configuracoes(nome: nome)));
          },
        ),
      ],
    ),
  );
}

// ===

PreferredSizeWidget appBarWidget(BuildContext context) {
  return AppBar(
    centerTitle: true, title: Text("Tela Inicial", style: TextStyle(color: Colors.white),),
    iconTheme: IconThemeData(
      color: Colors.white
    ),
    actions: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2563EB),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NivelUm()));
              },
              icon: Icon(Icons.person_2, color: Colors.white, size: 20,), 
              label: Text("Level: 0", style: TextStyle(color: Colors.white, fontSize: 16),)),
          ],              
        )    
      ),
      SizedBox(width: 10),
    ],
  );
}

// ===