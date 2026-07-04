import 'package:flutter/material.dart';
import '../routes/fade_route.dart';
import '../widgets/destination_screen.dart';
import '../widgets/section_banner.dart';

class FadeScreen extends StatelessWidget {
  const FadeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1. Fade Transition')),
      body: Column(
        children: [
          const SectionBanner(
            title: 'Concept',
            explanation:
                'The simplest custom transition: wrap `child` in a '
                'FadeTransition driven by `animation`. Good for subtle, '
                'low-distraction navigation — settings screens, modals.',
          ),
          const Spacer(),
          Center(
            child: FilledButton.icon(
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Push with Fade'),
              onPressed: () => Navigator.push(
                context,
                FadeRoute(
                  page: const DestinationScreen(
                    title: 'Faded In',
                    subtitle: 'FadeTransition + CurvedAnimation(easeInOut)',
                    color: Color(0xFF6C5CE7),
                    icon: Icons.blur_on,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
