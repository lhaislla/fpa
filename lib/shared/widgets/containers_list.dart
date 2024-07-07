import 'package:flutter/material.dart';
import 'package:fpa/shared/widgets/card_detalhes.dart';

class ContainerItem {
  final String aliasView;
  final String viewUrl;
  final int verificationNumber;
  final String verificationHour;

  ContainerItem({
    required this.aliasView,
    required this.viewUrl,
    required this.verificationNumber,
    required this.verificationHour,
  });
}

class ContainersList extends StatefulWidget {
  final List<ContainerItem> items;
  final Function() onItemAdded;

  ContainersList({required this.items, required this.onItemAdded});

  @override
  _ContainersListState createState() => _ContainersListState();
}

class _ContainersListState extends State<ContainersList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final item = widget.items[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CardDetailScreen(
                  cardNumber: item.aliasView,
                  lastAccessHour: item.verificationHour,
                  monitoringStartDate: '2023-01-01', // Exemplo de data simulada
                  lastModificationDate:
                      '2023-06-30', // Exemplo de data simulada
                  monitoringPeriod: '6 months', // Exemplo de período simulado
                ),
              ),
            );
          },
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(color: Colors.orange),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: Colors.orange,
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      title: Text(
                        item.aliasView,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      subtitle: Text(
                        item.viewUrl,
                        style: TextStyle(color: Colors.white70),
                      ),
                      trailing:
                          Icon(Icons.keyboard_arrow_right, color: Colors.white),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Number: ${item.verificationNumber}',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Hour: ${item.verificationHour}',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
