// views/home_monitoramento_page.dart

import 'package:flutter/material.dart';
import 'package:fpa/shared/widgets/containers_list.dart'; // Corrigindo o caminho de importação

class HomeMonitoramentoPage extends StatelessWidget {
  final List<String> containerItems = [
    'Container 1',
    'Container 2',
    'Container 3'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Site Checked'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu), // Ícone de menu do Material Design
            onPressed: () {
              // Implemente ação do ícone do menu aqui
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ContainersList(
          items: containerItems,
          onItemClick: (index) {
            // Implemente a ação quando um container for clicado
            Navigator.pushNamed(context, '/homeMonitoramento',
                arguments: containerItems[index]);
          },
        ),
      ),
    );
  }
}
