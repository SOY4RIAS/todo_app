import 'package:flutter/material.dart';

class DismissContainer extends StatelessWidget {
  final Color color;
  final IconData icon;
  final CrossAxisAlignment alignment;

  const DismissContainer({
    required this.color,
    required this.icon,
    this.alignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: alignment,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(icon)],
        ),
      ),
      color: color,
    );
  }
}
