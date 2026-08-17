import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';

class NivelUm extends StatefulWidget {
  final String nome;

  const NivelUm({super.key, required this.nome});

  @override
  State<NivelUm> createState() => _NivelUmState();
}

class _NivelUmState extends State<NivelUm> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, "Nível 1", widget.nome),
      drawer: drawerFazer(context, widget.nome),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final telaWidth = MediaQuery.of(context).size.width;
            final telaHeigth = MediaQuery.of(context).size.height;
            final telaPc = telaWidth > 600;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(20),
                  width: telaWidth * 0.75,
                  height: telaHeigth * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20)
                  ),

                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.only(top: 40),
                        child: Image.asset(
                          "assets/imagem/MeninoInputNome.png",
                          width: 200,
                          ),
                        ),


                      Padding(
                        padding: EdgeInsetsGeometry.only(top: 180),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: botaoMiniJogo(),
                              onPressed: () {

                            }, child: Text("1", style: TextStyle(
                              fontSize: 22
                            ),)),

                            ElevatedButton(
                              style: botaoMiniJogo(),
                              onPressed: () {

                            }, child: Text("2", style: TextStyle(
                              fontSize: 22
                            ),)),

                            ElevatedButton(
                              style: botaoMiniJogo(),
                              onPressed: () {

                            }, child: Text("3", style: TextStyle(
                              fontSize: 22
                            ),)),

                            ElevatedButton(
                              style: botaoMiniJogo(),
                              onPressed: () {

                            }, child: Text("4", style: TextStyle(
                              fontSize: 22
                            ),)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}