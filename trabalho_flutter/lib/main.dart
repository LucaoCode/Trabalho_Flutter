import 'package:flutter/material.dart';
import 'models/usuario.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Força de Vendas',
      home: LoginScreen(
        onLoginSuccess: (Usuario user) {
          // Redireciona para a tela principal (placeholder)
        },
      ),
    );
  }
}
