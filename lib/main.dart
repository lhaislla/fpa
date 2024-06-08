import 'package:flutter/material.dart';
import 'package:fpa/core/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      initialRoute: '/login',
      routes: loadRoutes(context),
      theme: ThemeData(
        // Definindo o tema padrão
        scaffoldBackgroundColor: Colors.white, // Cor de fundo das páginas
        primarySwatch: Colors.orange, // Cor principal do tema (laranja)
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.orange).copyWith(
          primary: Colors.orange, // Cor primária
          secondary: Colors.grey, // Cor secundária
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.orange, // Cor do texto dos ElevatedButton
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.orange, // Cor do texto dos TextButton
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor:
                Colors.orange, // Cor do contorno dos OutlinedButton
          ),
        ),
      ),
    );
  }
}
