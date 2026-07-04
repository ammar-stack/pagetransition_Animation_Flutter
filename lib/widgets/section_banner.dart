import 'package:flutter/material.dart';

class SectionBanner extends StatelessWidget {
  final String title;
  final String explanation;
  const SectionBanner({super.key, required this.title, required this.explanation});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: scheme.primaryContainer, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: scheme.onPrimaryContainer)),
          const SizedBox(height: 6),
          Text(explanation,
              style: TextStyle(fontSize: 13.5, height: 1.4, color: scheme.onPrimaryContainer.withOpacity(0.9))),
        ],
      ),
    );
  }
}
