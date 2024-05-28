import 'package:flutter/material.dart';
import 'package:fpa/shared/widgets/menu_lateral.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.white60,
      ),
      drawer: MenuLateral(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image/logo_fpa.png',
                  width: 200, // Aumentando o tamanho da logo
                  height: 200,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Site Checked',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                Text(
                  'O Site Checked é um aplicativo desenvolvido em Flutter que oferece uma solução para monitoramento de disponibilidade de sites. ',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Funcionalidades',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Text(
                  '• Verificação de Disponibilidade: Site Checked permite verificar se um site está ativo ou inativo com base na comparação de um hash único associado a ele.\n'
                  '• Monitoramento Automatizado: O aplicativo realiza verificações periódicas de disponibilidade dos sites, comparando o hash atual com o hash armazenado. Qualquer alteração no hash indica uma possível mudança na disponibilidade do site.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
