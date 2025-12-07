import 'package:flutter/material.dart';
import 'pages/prediction_page.dart';

void main() {
  runApp(const LaptopPredictorApp());
}

class LaptopPredictorApp extends StatelessWidget {
  const LaptopPredictorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white12,
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
      home: const PredictionPage(),
    );
  }
}
