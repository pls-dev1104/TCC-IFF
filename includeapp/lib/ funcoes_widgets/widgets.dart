import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/funcoes.dart';
import 'package:includeapp/principal/inicial.dart';
import 'package:flutter_tts/flutter_tts.dart';

//==

//Widget que cria os botoes 
// ignore: camel_case_types
class BotaoNivel_MiniJogos extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final VoidCallback aoClicar; // A ação que o botão vai executar

  const BotaoNivel_MiniJogos({
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

// ignore: camel_case_types
class BotaoNivel_Inicial extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final VoidCallback aoClicar; // A ação que o botão vai executar

  const BotaoNivel_Inicial({
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
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitulo,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}


//===

PreferredSizeWidget appBarWidget(
  BuildContext context,
  String titulo,
  String nome,
) {
  return AppBar(
    centerTitle: true,
    title: Text(titulo, style: TextStyle(color: Colors.white)),
    iconTheme: IconThemeData(color: Colors.white),    
  );
}

// ===

PreferredSizeWidget appBarWidgetMiniJogo(
  BuildContext context,
  String titulo, {
  int? etapaAtual,
  int? totalEtapas,
}) {
  final int atual = etapaAtual ?? 0;
  final int total = totalEtapas ?? 0;
  final bool mostrarProgresso = total > 0;

  // Etapas já concluídas / total (na etapa 1 começa vazia)
  final double progressoFinal = ((atual - 1) / total).clamp(0.0, 1.0);
  final double progressoInicial = ((atual - 2) / total).clamp(0.0, 1.0);

  return AppBar(
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Inicial()),(_) => false);
      }, 
      icon: Icon(Icons.close, size: 24,)),
    title: Text(titulo, style: TextStyle(color: Colors.white)),
    iconTheme: IconThemeData(color: Colors.white),
    bottom: mostrarProgresso
        ? PreferredSize(
            preferredSize: Size.fromHeight(16),
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 6),
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: progressoInicial, end: progressoFinal),
                duration: Duration(milliseconds: 600),
                builder: (context, valor, _) {
                  return LinearProgressIndicator(
                    value: valor,
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(10),
                    backgroundColor: Colors.white24,
                    color: Colors.white70,
                  );
                },
              ),
            ),
          )
        : null,
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

final FlutterTts leitorVoz = FlutterTts();

Future<void> encerrarVoz() async {
  await leitorVoz.stop();
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
      fixedSize: WidgetStateProperty.all(
        Size(pTelaPc ? 150 : 115, pTelaPc ? 100 : 90),
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

  Future<void> lerPergunta() async {
    await leitorVoz.setLanguage('pt-BR');
    await leitorVoz.setPitch(0.7);
    await leitorVoz.setSpeechRate(0.6);
    await leitorVoz.setVolume(1);
    await leitorVoz.stop();
    await leitorVoz.speak(pPergunta.toString());
  }

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
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

              SizedBox(height: 12),

              ElevatedButton.icon(
                onPressed: lerPergunta,
                icon: Icon(Icons.volume_up_rounded, size: 28),
                label: Text('Ouvir', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4F6BED),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 6,
                  shadowColor: Color(0x804F6BED),
                ),
              ),

              SizedBox(height: 16),

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

Widget fimdoquiz(
  BuildContext context, 
  int nivel, [
  Widget Function(BuildContext)? proximaTela,
]) {
  ButtonStyle estiloBotaoFim() {
    return ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF2563EB),
      foregroundColor: Colors.white,
      minimumSize: Size(double.infinity, 64),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }

  return Scaffold(
    body: Center(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 480),
          child: Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.emoji_events, size: 96, color: Color(0xFF2563EB)),
                SizedBox(height: 16),
                Text(
                  "Parabéns!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E3A59),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "O nível $nivel foi concluído",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Color(0xFF2E3A59)),
                ),
                SizedBox(height: 32),

                if (proximaTela != null) ...[
                  ElevatedButton.icon(
                    style: estiloBotaoFim(),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: proximaTela), (route) => false,
                      );
                    },
                    icon: Icon(Icons.arrow_forward),
                    label: Text(
                      "Próxima fase",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 16),
                ],

                ElevatedButton.icon(
                  style: estiloBotaoFim(),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Inicial()),
                      (route) => false,
                    );
                  },
                  icon: Icon(Icons.home),
                  label: Text(
                    "Voltar ao início",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

