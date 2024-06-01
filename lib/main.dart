import 'package:flutter/material.dart';
import 'package:binomial_visual/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Binomial Visual',
      onGenerateTitle: (context) {
        return 'Binomial Visual';
      },
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
