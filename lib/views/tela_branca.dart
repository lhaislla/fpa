import 'package:flutter/material.dart';

class ProximaTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Próxima Tela'),
      ),
      body: Center(
        child: Text(
          'Esta é a próxima tela!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
