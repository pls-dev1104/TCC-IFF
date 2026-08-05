import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';

class Perfil extends StatefulWidget {
  final String nome;

  const Perfil({super.key, required this.nome});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, "Perfil", widget.nome),
      drawer: drawerFazer(context, widget.nome),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {

            final telaWidth = MediaQuery.of(context).size.width;
            final telaHeight = MediaQuery.of(context).size.height;
            final telaPC = telaWidth > 600;

            final double telaSuperiorWidth;
            final double telaInferiorWidth;
            final double telaSuperiorHeight;
            final double telaInferiorHeight;
            final double telaLeftPessoa;
            final double telaTopPessoa;
            final double gapSuperiorInferior;
            final double bolaPerfil;

            if (telaPC) {
              gapSuperiorInferior = telaHeight * 0.02;
              telaSuperiorWidth = telaWidth * 0.40;
              telaInferiorWidth = telaWidth * 0.40;
              telaSuperiorHeight = telaHeight * 0.15;
              telaInferiorHeight = telaHeight * 0.70;
              telaLeftPessoa = telaWidth * 0.015;
              telaTopPessoa = telaSuperiorHeight * 0.60;
              bolaPerfil = telaHeight * 0.1;
            } else {
              gapSuperiorInferior = telaHeight * 0.02;
              telaSuperiorWidth = telaWidth * 0.50;
              telaInferiorWidth = telaWidth * 0.50;
              telaSuperiorHeight = telaHeight * 0.15;
              telaInferiorHeight = telaHeight * 0.75;
              telaLeftPessoa = telaWidth * 0.015;
              telaTopPessoa = telaSuperiorHeight * 0.4;
              bolaPerfil = telaHeight * 0.1;
            }

            return Center(
              child: SizedBox(
                width: telaWidth,
                child: Column(
                  children: [
                    SizedBox(height: gapSuperiorInferior),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: telaSuperiorWidth,
                              height: telaSuperiorHeight,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("OI"),
                                ],
                              ),
                            ),
                            Positioned(
                              left: telaLeftPessoa,
                              top: telaTopPessoa,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.account_circle, size: bolaPerfil),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 40),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: telaInferiorWidth,
                          height: telaInferiorHeight,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("OI"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}