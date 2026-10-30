//Funcoes
import 'package:flutter/material.dart';

String nomeUsuario = "";

void alertDialogAjuda(BuildContext context) {
  showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      title: Text("Ajuda?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      content: SizedBox(
        width: 160,
        height: 400,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Este app tem o intuito de te ensinar a mexer no celular através de quizes.\n", style: TextStyle(fontSize: 16)),
              Column(
                children: [
                  Icon(Icons.account_circle, color: Colors.black, size: 24),
                  Text("Ao clicar nesse botão você será direcionado para a página referente ao seu perfil.\n"),

                  Icon(Icons.menu, color: Colors.black, size: 24),
                  Text("Ao clicar nesse icone você abrirá uma menu lateral no qual você pode escolher qual página se direcionar.\n"),
                ],
              )
            ],
          ),
        ),
      ),
      actions: [
        SizedBox(
          width: 100,                                    
          height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white               
            ),
            onPressed: () {
              Navigator.pop(context);
            }, 
            child: Text("Voltar", style: TextStyle(fontSize: 16))),
        ),                        
      ],
    )
  );
}

// ===

void acerto(BuildContext context, Widget Function(BuildContext) navegar) {
  Navigator.push(context, MaterialPageRoute(builder: navegar));
}