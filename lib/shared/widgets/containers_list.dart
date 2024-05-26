// widgets/containers_list.dart

import 'package:flutter/material.dart';

class ContainersList extends StatelessWidget {
  final List<String> items;
  final Function(int)? onItemClick;

  ContainersList({required this.items, this.onItemClick});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          elevation: 4.0, // Define a elevação dos cards
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.grey[300]!), // Contorno cinza claro
          ),
          child: Container(
            height: 150, // Define a altura do card
            child: Column(
              children: [
                Container(
                  color: Colors.grey[200], // Cor de fundo cinza claro
                  child: ListTile(
                    contentPadding: EdgeInsets.all(
                        16.0), // Ajuste o preenchimento conforme necessário
                    title: Text(
                      items[index],
                      style: TextStyle(color: Colors.black87, fontSize: 18),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.keyboard_arrow_right),
                      onPressed: () {
                        onItemClick?.call(index);
                      },
                    ),
                    onTap: () {
                      onItemClick?.call(index);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
