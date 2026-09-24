import 'package:flutter/material.dart';
import 'package:includeapp/principal/inicial.dart';
import 'authentication.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 60),
              const SignupForm(),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Já possui cadastro? ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Faça o login',
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  String? nome;
  String? email;
  String? password;
  bool _obscureText = true;

  final passController = TextEditingController();

  @override
  void dispose() {
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(100.0)),
    );
    const space = SizedBox(height: 15);

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          //nome
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person_outline),
              labelText: 'Nome',
              border: border,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo vazio';
              }
              return null;
            },
            onSaved: (val) => nome = val,
            keyboardType: TextInputType.name,
          ),
          space,
          // Email
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              labelText: 'Email',
              border: border,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo vazio';
              }
              return null;
            },
            onSaved: (val) => email = val,
            keyboardType: TextInputType.emailAddress,
          ),
          space,

          // Password
          TextFormField(
            controller: passController,
            decoration: InputDecoration(
              labelText: 'Senha',
              prefixIcon: const Icon(Icons.lock_outline),
              border: border,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            obscureText: _obscureText,
            onSaved: (val) => password = val,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo vazio';
              }
              if (value.length < 6) {
                return 'A senha deve ter no mínimo 6 caracteres';
              }
              return null;
            },
          ),
          space,

          // Confirm Password
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Confirme a senha',
              prefixIcon: Icon(Icons.lock_outline),
              border: border,
            ),
            obscureText: true,
            validator: (value) {
              if (value != passController.text) {
                return 'Senhas não coincidem';
              }
              return null;
            },
          ),
          space,

          // Signup Button
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  AuthenticationHelper()
                      .signUp(email: email!, password: password!,nome: nome!)
                      .then((result) {
                    if (result == null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Inicial(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            AuthenticationHelper().traduzirRetorno(result),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      );
                    }
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                ),
              ),
              child: const Text('Registre-se', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
}