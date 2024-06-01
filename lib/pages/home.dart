import 'package:flutter/material.dart';
import 'package:data/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 1.0;

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
              for (var j=0;j<=20;j++)
                TableRow(
                  children: [
                    for (var i=0;i<=20;i++) 
                      TableCell(
                        child: Container(
                          color: (BinomialDistribution(j+i, value).cumulativeProbability(j) <= 0.1) ? Colors.red : (BinomialDistribution(i+j, value).cumulativeProbability(j) >= 0.9) ? Colors.green : null,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: Text(BinomialDistribution(j+i, value).cumulativeProbability(j).toStringAsFixed(2))
                          ),
                        ),
                      ),
                  ],
                ),
            ],
          ),
          TextField(
            onChanged: (string) {
              setState(() {
                value = double.parse(string);
              });
            }
          ),
        ],
      ),
    );
  }
}