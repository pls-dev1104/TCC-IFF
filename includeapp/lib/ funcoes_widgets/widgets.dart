import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/funcoes.dart';
import 'package:includeapp/configuracoes/perfil.dart';
import 'package:includeapp/principal/inicial.dart';
import 'package:includeapp/principal/mini_jogos.dart';

//Widget que cria os 20 botoes 
class BotaoNivel extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final VoidCallback aoClicar; // A ação que o botão vai executar

  const BotaoNivel({
    super.key,
    required this.titulo,
    required this.subtitulo,
    required this.aoClicar,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: aoClicar,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            titulo,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitulo,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}

//===

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

        ListTile(
          title: Text("Níveis", style: TextStyle(fontSize: 20)),
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MiniJogos()),
              (route) => false,
            );
          },
        ),

        ListTile(
          title: Text("Perfil", style: TextStyle(fontSize: 20)),
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Perfil()),
              (route) => false,
            );
          },
        ),

        ListTile(
          title: Text("Ajuda", style: TextStyle(fontSize: 20)),
          onTap: () {
            alertDialogAjuda(context);
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

PreferredSizeWidget appBarWidgetMiniJogo(BuildContext context, String titulo) {
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
  void Function() pSomAcerto,
  pSomErro,
  pErro1,
  pErro2,
  pErro3,
  pErro4,
  Widget pOpcao1,
  pOpcao2,
  pOpcao3,
  pOpcao4,
) {
  ButtonStyle estiloBotao(bool pCor) {
    return verificacaoBotao(pCor, pTelaPc).copyWith(
      minimumSize: WidgetStateProperty.all(
        Size(pTelaPc ? 220 : 115, pTelaPc ? 70 : 70),
      ),
      padding: WidgetStateProperty.all(
        EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      elevation: WidgetStateProperty.all(6),
    );
  }

  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient( //O fundo da imagem
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF5F7FA), Color(0xFFE4E9F2)],
            ),
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 12,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  pImagem,
                  width: pImagemTela,
                  cacheWidth: pCacheImagemTela,
                ),
              ),

              SizedBox(height: 16),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  pPergunta,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E3A59),
                  ),
                ),
              ),

              SizedBox(height: 28),

              Padding(
                padding: EdgeInsets.all(10),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 30,
                  runSpacing: 20,
                  children: [
                    ElevatedButton(
                      style: estiloBotao(pbotao1),
                      onPressed: () {
                        if (pEscolhaCerta1) {
                          pSomAcerto();
                          acerto(context, pProximaTela);
                        } else {
                          pErro1();
                          pSomErro();
                        }
                      },
                      child: pOpcao1,
                    ),
                    ElevatedButton(
                      style: estiloBotao(pbotao2),
                      onPressed: () {
                        if (pEscolhaCerta2) {
                          pSomAcerto();
                          acerto(context, pProximaTela);
                        } else {
                          pErro2();
                          pSomErro();
                        }
                      },
                      child: pOpcao2,
                    ),
                    ElevatedButton(
                      style: estiloBotao(pbotao3),
                      onPressed: () {
                        if (pEscolhaCerta3) {
                          pSomAcerto();
                          acerto(context, pProximaTela);
                        } else {
                          pErro3();
                          pSomErro();
                        }
                      },
                      child: pOpcao3,
                    ),
                    ElevatedButton(
                      style: estiloBotao(pbotao4),
                      onPressed: () {
                        if (pEscolhaCerta4) {
                          pSomAcerto();
                          acerto(context, pProximaTela);
                        } else {
                          pErro4();
                          pSomErro();
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
