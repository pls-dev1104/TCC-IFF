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
  String pImagem,
  pPergunta,
  Widget Function(BuildContext) pProximaTela,
  double pImagemTela,
  int pCacheImagemTela,
  bool pTelaPc,
  pbotao1,
  pbotao2,
  pbotao3,
  pbotao4,
  pEscolhaCerta1,
  pEscolhaCerta2,
  pEscolhaCerta3,
  pEscolhaCerta4,
  void Function() pErro1,
  pErro2,
  pErro3,
  pErro4,
  Widget pOpcao1,
  pOpcao2,
  pOpcao3,
  pOpcao4,
) {
  // Estilo padrão dos botões, agora maior e com efeito de elevação
  ButtonStyle estiloBotao(bool pCor) {
    return verificacaoBotao(pCor, pTelaPc).copyWith(
      minimumSize: WidgetStateProperty.all(
        Size(pTelaPc ? 220 : 150, pTelaPc ? 70 : 60),
      ),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      elevation: WidgetStateProperty.all(6),
      textStyle: WidgetStateProperty.all(
        const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF5F7FA), Color(0xFFE4E9F2)],
            ),
            borderRadius: BorderRadius.circular(28),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  pImagem,
                  width: pImagemTela,
                  cacheWidth: pCacheImagemTela,
                ),
              ),

              const SizedBox(height: 16),

              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  pPergunta,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E3A59),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 24,
                  runSpacing: 20,
                  children: [
                    ElevatedButton(
                      style: estiloBotao(pbotao1),
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
                      style: estiloBotao(pbotao2),
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
                      style: estiloBotao(pbotao3),
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
                      style: estiloBotao(pbotao4),
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
    ),
  );
}
