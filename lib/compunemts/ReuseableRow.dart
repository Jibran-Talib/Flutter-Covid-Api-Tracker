import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ReuseableRow extends StatelessWidget {
  String title, value;
  ReuseableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                value,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
