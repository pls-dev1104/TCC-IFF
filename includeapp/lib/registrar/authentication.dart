import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get user => _auth.currentUser;

  // Criar novo usuário
  Future<String?> signUp({
    required String email,
    required String password,
    required String nome,
  }) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

    await userCredential.user?.updateDisplayName(nome);
    await userCredential.user?.reload();
    
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // Fazer login
  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // Deslogar
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Tradução das mensagens de erro do Firebase
  String traduzirRetorno(String msg) {
    switch (msg) {
      case "The email address is badly formatted.":
        return "Formato inválido de email";
      case "Password should be at least 6 characters":
        return "A senha deve possuir ao menos 6 caracteres";
      case "The email address is already in use by another account.":
        return "O email digitado já está em uso por outra conta";
      case "The password is invalid or the user does not have a password.":
        return "Senha inválida.";
      case "There is no user record corresponding to this identifier. The user may have been deleted.":
        return "Usuário não encontrado.";
      default:
        return msg;
    }
  }
}