import 'package:flutter/material.dart';

Widget drawerFazer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blueAccent
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