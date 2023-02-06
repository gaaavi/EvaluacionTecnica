import 'package:evaluacion_tecnica_niu/screens/posts_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Prueba tecnica",

      /// Definir ruta inicial de la aplicacion
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
      },

      /// Definir temas globales para el AppBar
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(60, 97, 117, 1),
          elevation: 0,
        ),
      ),
    );
  }
}
