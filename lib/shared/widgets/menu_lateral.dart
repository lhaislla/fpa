// menu_lateral.dart

import 'package:flutter/material.dart';
import 'package:fpa/services/log_out.dart'; // Importe o arquivo log_out.dart

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey, // Cor de fundo do cabeçalho
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.view_list),
            title: Text('Views'),
            onTap: () {
              // Implemente a navegação para a página de views
              Navigator.pushNamed(context, '/views');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Implemente a navegação para a página de configurações
              Navigator.pushNamed(context, '/settings');
            },
          ),
          Spacer(), // Adiciona um espaçamento flexível
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              LogOut.signOut(context); // Chama a função de logout
            },
          ),
        ],
      ),
    );
  }
}
