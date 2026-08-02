import 'package:flutter/material.dart';

void alertDialogAjuda(BuildContext context) {
  showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      title: Text("Mapa do conhecimento", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      content: SizedBox(
        width: 160,
        height: 400,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Este local tem o intuito de ser o lugar você aprenderá a usar o celular de forma divertida por meio de minijogos.\n", style: TextStyle(fontSize: 16)),
              Column(
                children: [
                  Text("Nível 0:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  Text("você aprenderá a criar um alarme, salvar o contato de alguém, chamadas e muito mais.\n"),

                  Text("Nível 1:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),                                          Text("você aprenderá a criar um email, instalação de apps, whatsapp e etc.\n"),
                  Text("você aprenderá a criar um email, instalação de apps, whatsapp e etc.\n"),

                  Text("Nível 2:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  Text("você aprenderá a navegar na internet, login em apps, mexer no youtube, além de outras coisas.\n")
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