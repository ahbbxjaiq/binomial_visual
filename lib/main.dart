import 'package:flutter/material.dart';
import 'package:binomial_visual/pages/home.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() => runApp(
  const ProviderScope(
    child: MyApp()
  ),
);

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
