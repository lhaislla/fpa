// views/home_monitoramento_page.dart

import 'package:flutter/material.dart';
import 'package:fpa/shared/widgets/containers_list.dart';
import 'package:fpa/shared/widgets/menu_lateral.dart';

class HomeMonitoramentoPage extends StatefulWidget {
  @override
  _HomeMonitoramentoPageState createState() => _HomeMonitoramentoPageState();
}

class _HomeMonitoramentoPageState extends State<HomeMonitoramentoPage> {
  List<String> containerItems = ['Container 1', 'Container 2', 'Container 3'];

  void _addNewItem() {
    setState(() {
      int newItemIndex = containerItems.length + 1;
      containerItems.add('Container $newItemIndex');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Site Checked'),
        centerTitle: true, // Centraliza o título
        backgroundColor:
            Colors.white60, // Define a cor da barra superior em um tom de cinza
      ),
      drawer: MenuLateral(), // Adiciona o menu lateral no lado esquerdo
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
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewItem,
        child: Icon(Icons.add),
        backgroundColor: Colors.grey, // Cor de fundo cinza
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Borda circular
        ),
      ),
    );
  }
}
