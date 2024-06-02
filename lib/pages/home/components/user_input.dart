import 'package:binomial_visual/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserInput extends StatelessWidget {
  const UserInput({
    super.key,
    required this.ref,
  });

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return TextField(
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
    );
  }
}
