//Funcoes
import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';

//==
Color background = Color(0xFFFFFFFF);
Color appbar = Color(0xFF2563EB);

// Avisa o App quando as cores mudam (para ele se reconstruir)
final ValueNotifier<int> temaNotifier = ValueNotifier(0);

// Função que altera as duas cores
void trocarCores() {
  background = background == Color(0xFFFFFFFF) ? Color(0xFF0F172A) : Color(0xFFFFFFFF);
  appbar = appbar == Color(0xFF2563EB) ? Color(0xFF1E293B) : Color(0xFF2563EB);
  temaNotifier.value++; // dispara o rebuild do App
}

//Acerto


void acerto(BuildContext context, Widget Function(BuildContext) navegar) {
  encerrarVoz();
  Navigator.push(context, MaterialPageRoute(builder: navegar));
}

Future<void> nivelTerminou(int nivel) async {
  try {
    print("Nível $nivel terminou");
  } catch (erro) {
    print("Erro ao atualizar o nível $nivel");
  }
}