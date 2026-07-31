import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset(
            "assets/lotties/List.json",
            width: 300,
            height: 300,
            fit: BoxFit.scaleDown,
          ),
        ),
        // const SizedBox(height: 8,),
        const Text("Empty list",style: TextStyle(fontSize: 20,color: Colors.grey),)
      ],
    );
  }
}
