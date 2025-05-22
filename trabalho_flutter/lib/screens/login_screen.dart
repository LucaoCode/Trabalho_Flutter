import 'package:flutter/material.dart';
import '../controllers/usuario_controller.dart';
import '../models/usuario.dart';

class LoginScreen extends StatefulWidget {
  final Function(Usuario) onLoginSuccess;

  const LoginScreen({super.key, required this.onLoginSuccess});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usuarioController = TextEditingController();
  final _senhaController = TextEditingController();
  final _controller = UsuarioController();

  @override
  void initState() {
    super.initState();
    _controller.carregarUsuarios();
  }

  void _login() async {
    final nome = _usuarioController.text;
    final senha = _senhaController.text;

    await _controller.carregarUsuarios();
    final usuario = _controller.autenticar(nome, senha);

    if (usuario != null) {
      widget.onLoginSuccess(usuario);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuário ou senha inválidos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _usuarioController, decoration: InputDecoration(labelText: 'Usuário')),
            TextField(controller: _senhaController, obscureText: true, decoration: InputDecoration(labelText: 'Senha')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: Text('Entrar')),
          ],
        ),
      ),
    );
  }
}
