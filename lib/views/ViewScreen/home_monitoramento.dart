import 'package:flutter/material.dart';
import 'package:fpa/shared/widgets/menu_lateral.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.white60,
      ),
      drawer: MenuLateral(),
      body: Center(
        child: Text(
          'Site Checked',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
