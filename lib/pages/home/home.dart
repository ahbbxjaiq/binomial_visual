import 'package:binomial_visual/pages/home/components/binomial_table.dart';
import 'package:binomial_visual/pages/home/components/user_input.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final valueProvider = StateProvider<double>(
  (ref) => 1.0,
);

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    ref.read(valueProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Binomial Visual'),
        elevation: 1.0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const BinomialTable(),
          UserInput(ref: ref),
        ],
      ),
    );
  }


}
