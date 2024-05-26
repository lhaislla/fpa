import 'package:flutter/material.dart';

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
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.grey[300]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.grey[300],
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  title: Text(
                    item.aliasView,
                    style: TextStyle(color: Colors.black87, fontSize: 18),
                  ),
                  subtitle: Text(item.viewUrl),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
        );
      },
    );
  }
}
