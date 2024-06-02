import 'package:flutter/material.dart';
import 'package:data/data.dart';
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
          Table(
            border: TableBorder.all(),
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Container(),
                  ),
                  for (var l=0;l<=20;l++) 
                    TableCell(
                      child: Center(
                        child: Text(
                          l.toString(),
                          textAlign: TextAlign.center,
                        )
                      )
                    ),
                ],
              ),
              for (var j=0;j<=20;j++)
                TableRow(
                  children: [
                      TableCell(
                        child: Center(
                          child: Text(
                            j.toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    for (var i=0;i<=20;i++) 
                        tableCell(j, i),
                  ],
                ),
            ],
          ),
          TextField(
            onChanged: (string) {
              if (string == "") {
                return;
              }
              
              var input = double.parse(string);

              // Guard Clause (Outside of 0.0 - 1.0)
              if (input > 1.0 || input < 0.0) { 
                return;
              }

              ref.read(valueProvider.notifier).update((state) => double.parse(string));
            }
          ),
        ],
      ),
    );
  }


  TableCell tableCell(int j, int i) {
    final value = ref.watch(valueProvider);
    var result = BinomialDistribution(j+i, value).cumulativeProbability(j);
    return TableCell(
      child: Container(
        color: (result <= 0.1) ? const Color.fromRGBO(240, 186, 182, 1) : (result >= 0.9) ? const Color.fromRGBO(169, 220, 194, 1): null,
        child: Padding(
          padding: const EdgeInsets.only(left: 3.5, top: 0.5, bottom: 0.5),
          child: Center(
            child: Text(
              result.toStringAsFixed(2),
              textAlign: TextAlign.right,
            )
          ),
        ),
      ),
    );
  }
}