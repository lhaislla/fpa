// view.dart

import 'package:flutter/material.dart';
import 'package:fpa/shared/widgets/containers_list.dart';
import 'package:fpa/shared/widgets/menu_lateral.dart';
import 'package:fpa/views/ViewScreen/new_view.dart';

class ViewMonitoramento extends StatefulWidget {
  @override
  _ViewMonitoramentoState createState() => _ViewMonitoramentoState();
}

class _ViewMonitoramentoState extends State<ViewMonitoramento> {
  List<ContainerItem> containerItems = [
    ContainerItem(
      aliasView: 'Container 1',
      viewUrl: 'https://example.com/container1',
      verificationNumber: 1,
      verificationHour: '00:00',
    ),
    ContainerItem(
      aliasView: 'Container 2',
      viewUrl: 'https://example.com/container2',
      verificationNumber: 2,
      verificationHour: '01:00',
    ),
    ContainerItem(
      aliasView: 'Container 3',
      viewUrl: 'https://example.com/container3',
      verificationNumber: 3,
      verificationHour: '02:00',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Views'),
        centerTitle: true, // Centraliza o título
        backgroundColor:
            Colors.white60, // Define a cor da barra superior em um tom de cinza
      ),
      drawer: MenuLateral(), // Adiciona o menu lateral no lado esquerdo
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ContainersList(
          items: containerItems,
          onItemAdded: _navigateToNewView,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToNewView,
        child: Icon(Icons.add),
        backgroundColor: Colors.grey, // Cor de fundo cinza
        shape: CircleBorder(),
      ),
    );
  }

  void _navigateToNewView() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewViewScreen()),
    );
    if (result != null && result is ContainerItem) {
      setState(() {
        containerItems.add(result);
      });
    }
  }
}
