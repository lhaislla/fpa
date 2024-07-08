import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Para armazenar o hash
import "package:fpa/services/hash.dart";

class HashCheckerScreen extends StatefulWidget {
  @override
  _HashCheckerScreenState createState() => _HashCheckerScreenState();
}

class _HashCheckerScreenState extends State<HashCheckerScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  late String _storedHash;

  @override
  void initState() {
    super.initState();
    _loadStoredHash();
  }

  Future<void> _loadStoredHash() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _storedHash = prefs.getString('storedHash')!;
    });
  }

  Future<void> _saveHash(String hash) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('storedHash', hash);
  }

  void _generateAndSaveHash() {
    String id = _idController.text;
    String url = _urlController.text;
    String newHash = generateHash(id, url);
    _saveHash(newHash);
    setState(() {
      _storedHash = newHash;
    });
  }

  void _checkForChanges() {
    String id = _idController.text;
    String url = _urlController.text;
    bool hashChanged = hasHashChanged(id, url, _storedHash);
    String message = hashChanged ? 'O hash mudou!' : 'O hash não mudou.';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Resultado'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verificador de Hash')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _idController,
              decoration: InputDecoration(labelText: 'ID'),
            ),
            TextField(
              controller: _urlController,
              decoration: InputDecoration(labelText: 'URL'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateAndSaveHash,
              child: Text('Gerar e Salvar Hash'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkForChanges,
              child: Text('Verificar Mudanças'),
            ),
          ],
        ),
      ),
    );
  }
}
