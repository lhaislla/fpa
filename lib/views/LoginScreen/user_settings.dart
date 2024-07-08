import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserSettingsScreen extends StatefulWidget {
  @override
  _UserSettingsScreenState createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _usernameController = TextEditingController();
  late String _currentUsername;

  @override
  void initState() {
    super.initState();
    _getCurrentUsername();
  }

  // Função para carregar o nome de usuário atual do Firebase
  Future<void> _getCurrentUsername() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(user.uid).get();
      if (doc.exists) {
        setState(() {
          _currentUsername = doc.get('username');
          _usernameController.text = _currentUsername;
        });
      }
    }
  }

  // Função para atualizar o nome de usuário no Firebase
  Future<void> _updateUsername(String newUsername) async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        await _firestore.collection('users').doc(user.uid).update({
          'username': newUsername,
        });
        Fluttertoast.showToast(
          msg: "Username updated successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      } catch (e) {
        print('Error updating username: $e');
        Fluttertoast.showToast(
          msg: "Failed to update username",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Username',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            RoundedInputField(
              hintText: '',
              controller: _usernameController,
            ),
            SizedBox(height: 32.0),
            RoundedButton(
              onPressed: () {
                _updateUsername(_usernameController.text.trim());
              },
              text: 'Update Username',
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: hintText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), // Alterado para 30.0
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Alterado para 30.0
        ),
        padding:
            EdgeInsets.symmetric(vertical: 16.0), // Adicionado padding vertical
        backgroundColor: Colors.orange, // Alterado para laranja
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16.0, color: Colors.white), // Cor do texto branca
      ),
    );
  }
}
