import 'package:flutter/material.dart';
import 'package:includeapp/configurancoes.dart';
//import ;'package:includeapp/perfil.dart'
import 'package:includeapp/%20funcoes_widgets/funcoes.dart';
//import 'package:includeapp/inicial.dart';

Widget drawerFazer(BuildContext context, String nome) {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Color(0xFF2563EB)),
          child: Text(
            "Atalhos",
            style: TextStyle(color: Colors.white, fontSize: 26),
          ),
        ),

        ListTile(
          title: Text("Início", style: TextStyle(fontSize: 20)),
          onTap: () {
           /* Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Inicial(nome: nome)),
              (route) => false,
            );*/
          },
        ),

        ListTile(title: Text("Mini-jogos", style: TextStyle(fontSize: 20))),

        ListTile(
          title: Text("Perfil", style: TextStyle(fontSize: 20)),
          onTap: () {
          //  Navigator.push(
             // context,
              //MaterialPageRoute(builder: (context) => Perfil(nome: nome)),
           // );
          },
        ),

        ListTile(
<<<<<<< HEAD
          title: Text("Ajuda", style: TextStyle(fontSize: 20)),
=======
          title: Text("Mini-jogos", style: 
            TextStyle(
              fontSize: 20
            ),
          ),
        ),

        ListTile(
          title: Text("Perfil", style: 
            TextStyle(
              fontSize: 20
            ),
          ),
          onTap: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Perfil(nome: nome)), (route) => false);
          },
        ),

        ListTile(
          title: Text("Ajuda", style: 
            TextStyle(
              fontSize: 20
            ),
          ),
>>>>>>> a4e67a2898efcd1d03f7dca5dc9e3e24717c1589
          onTap: () {
            alertDialogAjuda(context);
          },
        ),

        ListTile(
          title: Text("Configurações", style: TextStyle(fontSize: 20)),
          onTap: () {
<<<<<<< HEAD
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Configurancoes(nome: nome),
              ),
            );
=======
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Configurancoes(nome: nome)), (route) => false);
>>>>>>> a4e67a2898efcd1d03f7dca5dc9e3e24717c1589
          },
        ),
      ],
    ),
  );
}

// ===

PreferredSizeWidget appBarWidget(
  BuildContext context,
  String titulo,
  String nome,
) {
  return AppBar(
    centerTitle: true,
    title: Text(titulo, style: TextStyle(color: Colors.white)),
    iconTheme: IconThemeData(color: Colors.white),
    actions: [
      Row(
        children: [
          IconButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF2563EB)),
            onPressed: () {/*
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Perfil(nome: nome)),
              );*/
            },
            icon: Icon(Icons.account_circle, color: Colors.white, size: 24),
          ),
        ],
      ),
      SizedBox(width: 10),
    ],
  );
}

// ===

ButtonStyle botaoMiniJogo() {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.blueAccent,
    foregroundColor: Colors.white,
    minimumSize: Size(100, 75),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(30),
    ),
  );
}
<<<<<<< HEAD
=======

ButtonStyle botaoMiniJogoErro() {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.redAccent,
    foregroundColor: Colors.white,
    minimumSize: Size(100, 75),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(30),
    ),
  );
}

ButtonStyle VerificacaoBotao(bool numero) {
  if (!numero) {
    return botaoMiniJogo();
  } else {
    return botaoMiniJogoErro();
  }
}

Widget padronizacaoJogo(BuildContext context, String pNome, String pImagem, String pPergunta, Widget Function(BuildContext) pProximaTela, double pTelaWidth, double pTelaHeight, bool pbotao1, bool pbotao2, bool pbotao3, bool pbotao4, bool pEscolhaCerta1, bool pEscolhaCerta2, bool pEscolhaCerta3, bool pEscolhaCerta4, void Function() pErro1, void Function() pErro2, void Function() pErro3, void Function() pErro4, Widget pOpcao1, Widget pOpcao2, Widget pOpcao3, Widget pOpcao4) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        width: pTelaWidth * 0.30,
        height: pTelaHeight * 0.9,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(top: 0),
              child: Image.asset(
                pImagem,
                width: 285,
                cacheWidth: 570,
              ),
            ),

            Padding(
              padding: EdgeInsetsGeometry.only(top: 30),
              child: Text(
                pPergunta,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: EdgeInsetsGeometry.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: VerificacaoBotao(pbotao1),
                    onPressed: () {
                      if (pEscolhaCerta1) {
                        acerto(context, pProximaTela);
                      } else {
                        pErro1();
                      }
                    },
                    child: pOpcao1,
                  ),

                  ElevatedButton(
                    style: VerificacaoBotao(pbotao2),
                    onPressed: () {
                      if (pEscolhaCerta2) {
                        acerto(context, pProximaTela);
                      } else {
                        pErro2();
                      }
                    },
                    child: pOpcao2,
                  ),

                  ElevatedButton(
                    style: VerificacaoBotao(pbotao3),
                    onPressed: () {
                      if (pEscolhaCerta3) {
                        acerto(context, pProximaTela);
                      } else {
                        pErro3();
                      }
                    },
                    child: pOpcao3,
                  ),

                  ElevatedButton(
                    style: VerificacaoBotao(pbotao4),
                    onPressed: () {
                      if (pEscolhaCerta4) {
                        acerto(context, pProximaTela);
                      } else {
                        pErro4();
                      }
                    },
                    child: pOpcao4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
>>>>>>> a4e67a2898efcd1d03f7dca5dc9e3e24717c1589
