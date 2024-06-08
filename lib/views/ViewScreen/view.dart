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
      aliasView: 'UFRPE',
      viewUrl: 'https://ufrpe.br/',
      verificationNumber: 1,
      verificationHour: '08:00',
    ),
    ContainerItem(
      aliasView: 'INEP',
      viewUrl: 'https://www.gov.br/inep/pt-br',
      verificationNumber: 2,
      verificationHour: '12:00',
    ),
    ContainerItem(
      aliasView: 'IBGE',
      viewUrl: 'https://www.ibge.gov.br/',
      verificationNumber: 3,
      verificationHour: '13:00',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Views'),
        centerTitle: true, // Centraliza o título
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
