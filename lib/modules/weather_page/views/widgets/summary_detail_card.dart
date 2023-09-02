import 'package:flutter/material.dart';

class SummaryDetailCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String valueTitle;
  const SummaryDetailCard({
    Key? key,
    required this.icon,
    required this.value,
    required this.valueTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          value,
          style: const TextStyle(
            color: Color.fromARGB(255, 44, 44, 44),
            fontSize: 16,
            fontFamily: 'Circular Std',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          valueTitle,
          style: const TextStyle(
            color: Color.fromARGB(255, 44, 44, 44),
            fontSize: 16,
            fontFamily: 'Circular Std',
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
