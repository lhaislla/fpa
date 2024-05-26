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
        return GestureDetector(
          onTap: () {
            onItemClick?.call(index);
          },
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.grey[300]!), // Contorno cinza claro
            ),
            child: Center(
              child: Text(
                items[index],
                style: TextStyle(color: Colors.black87, fontSize: 18),
              ),
            ),
          ),
        );
      },
    );
  }
}
