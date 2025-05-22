import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class StorageService {
  final String fileName;

  StorageService(this.fileName);

  Future<File> _getFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$fileName');
  }

  Future<List<dynamic>> readJson() async {
    try {
      final file = await _getFile();
      final content = await file.readAsString();
      return jsonDecode(content);
    } catch (e) {
      return [];
    }
  }

  Future<void> saveJson(List<dynamic> json) async {
    final file = await _getFile();
    await file.writeAsString(jsonEncode(json));
  }
}
