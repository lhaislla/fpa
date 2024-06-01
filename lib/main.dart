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
        primarySwatch: Colors.grey, // Você pode ajustar ou remover essa linha
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(
          primary: Colors.grey,
          secondary: Colors.grey,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Colors.grey, // Define a cor padrão do ElevatedButton
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.grey, // Define a cor padrão do TextButton
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor:
                Colors.grey, // Define a cor padrão do OutlinedButton
          ),
        ),
      ),
    );
  }
}
