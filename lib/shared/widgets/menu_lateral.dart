import 'package:flutter/material.dart';
import 'package:fpa/services/log_out.dart';

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
              'Site Checked',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/homeMonitoramento');
            },
          ),
          Spacer(),
          ListTile(
            leading: Icon(Icons.view_list),
            title: Text('Views'),
            onTap: () {
              Navigator.pushNamed(context, '/view_monitoramento');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, '/user_settings');
            },
          ),
          Spacer(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              LogOut.signOut(context);
            },
          ),
        ],
      ),
    );
  }
}
