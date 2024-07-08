import 'package:flutter/material.dart';

class SharedViewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compartilhamento de Views'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                _buildSharedViewCard(
                  alias: 'UFRPE',
                  url: 'https://ufrpe.br/',
                  sharedWithEmails: [
                    'lhaislla.cavalcanti@ufrpe.br',
                    'jessica.lima@ufrpe.br',
                  ],
                ),
                SizedBox(height: 16.0),
                _buildSharedViewCard(
                  alias: 'INEP',
                  url: 'https://www.gov.br/inep/pt-br',
                  sharedWithEmails: [
                    'carlos@gmail.com',
                    'maria@gmail.com',
                    'joao@gmail.com',
                    'pedro@gmail.com',
                  ],
                ),
                SizedBox(height: 16.0),
                _buildSharedViewCard(
                  alias: 'IBGE',
                  url: 'https://www.ibge.gov.br/',
                  sharedWithEmails: [
                    'hugo.claus@hotmail.com',
                    'geovanni.silva5@gmail.com',
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSharedViewCard({
    required String alias,
    required String url,
    required List<String> sharedWithEmails,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(color: Colors.orange, width: 2.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        leading: Icon(Icons.notifications, color: Colors.orange),
        title: Text(
          alias,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('URL: $url', style: TextStyle(color: Colors.orange)),
            SizedBox(height: 8.0),
            Text('Compartilhado com:'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: sharedWithEmails.map((email) => Text(email)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SharedViewsScreen(),
    theme: ThemeData(
      primarySwatch: Colors.orange,
    ),
  ));
}
