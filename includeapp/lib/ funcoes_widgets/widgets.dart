import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/funcoes.dart';
import 'package:includeapp/configuracoes/configurancoes.dart';
import 'package:includeapp/configuracoes/perfil.dart';
import 'package:includeapp/principal/inicial.dart';

Widget drawerFazer(BuildContext context) {
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
           Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Inicial()),
              (route) => false,
            );
          },
        ),

        ListTile(title: Text("Mini-jogos", style: TextStyle(fontSize: 20))),

        ListTile(
          title: Text("Perfil", style: 
            TextStyle(
              fontSize: 20
            ),
          ),
          onTap: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Perfil()), (route) => false);
          },
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
          title: Text("Configurações", style: TextStyle(fontSize: 20)),
          onTap: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Configurancoes(nome: "")), (route) => false);
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Perfil()),
              );
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

PreferredSizeWidget appBarWidgetMiniJogo(
  BuildContext context,
  String titulo,
) {
  return AppBar(
    centerTitle: true,
    title: Text(titulo, style: TextStyle(color: Colors.white)),
    iconTheme: IconThemeData(color: Colors.white),
  );
}

// ===

ButtonStyle botaoMiniJogo(bool pTelaPC) {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.blueAccent,
    foregroundColor: Colors.white,
    minimumSize: tamanhoBotaoPorTela(pTelaPC),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(30),
    ),
  );
}

ButtonStyle botaoMiniJogoErro(bool pTelaPc) {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.redAccent,
    foregroundColor: Colors.white,
    minimumSize: tamanhoBotaoPorTela(pTelaPc),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(30),
    ),
  );
}

Size tamanhoBotaoPorTela(bool pTelaPc) {
  if (pTelaPc) {
    return Size(125, 80);
  } else {
    return Size(90, 70);
  }
}

ButtonStyle verificacaoBotao(bool numero, pTelaPc) {
  if (!numero) {
    return botaoMiniJogo(pTelaPc);
  } else {
    return botaoMiniJogoErro(pTelaPc);
  }
}

Widget padronizacaoJogo(
  BuildContext context, 
  String pNome, pImagem, pPergunta, 
  Widget Function(BuildContext) pProximaTela, 
  double pBorderWidth, pBorderHeight, pImagemTela, 
  int pCacheImagemTela,
  bool pTelaPc, pbotao1, pbotao2, pbotao3, pbotao4, pEscolhaCerta1, pEscolhaCerta2, pEscolhaCerta3, pEscolhaCerta4, 
  void Function() pErro1, pErro2, pErro3, pErro4, 
  Widget pOpcao1, pOpcao2, pOpcao3, pOpcao4) {

  return SingleChildScrollView( 
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.all(10),
        width: pBorderWidth,
        height: pBorderHeight,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Image.asset(
                pImagem,
                width: pImagemTela,
                cacheWidth: pCacheImagemTela,
              ),
            ),

            Padding(
              padding: EdgeInsetsGeometry.only(top: 5),
              child: Text(
                pPergunta,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: verificacaoBotao(pbotao1, pTelaPc),
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
                        style: verificacaoBotao(pbotao2, pTelaPc),
                        onPressed: () {
                          if (pEscolhaCerta2) {
                            acerto(context, pProximaTela);
                          } else {
                            pErro2();
                          }
                        },
                        child: pOpcao2,
                      ),
                    ],
                  ),

                  SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: verificacaoBotao(pbotao3, pTelaPc),
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
                        style: verificacaoBotao(pbotao4, pTelaPc),
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
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
  );
}
