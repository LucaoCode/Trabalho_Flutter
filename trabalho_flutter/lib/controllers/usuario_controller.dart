import '../models/usuario.dart';
import '../services/storage_service.dart';

class UsuarioController {
  final _storage = StorageService('usuarios.json');
  List<Usuario> usuarios = [];

  Future<void> carregarUsuarios() async {
    final dados = await _storage.readJson();
    usuarios = dados.map((e) => Usuario.fromJson(e)).toList();
  }

  Usuario? autenticar(String nome, String senha) {
    if (nome == 'admin' && senha == 'admin') {
      return Usuario(id: 0, nome: 'admin', senha: 'admin');
    }

    try {
      return usuarios.firstWhere((u) => u.nome == nome && u.senha == senha);
    } catch (_) {
      return null;
    }
  }
}
