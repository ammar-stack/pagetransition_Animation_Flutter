import 'package:flutter/material.dart';
import '../routes/rotation_route.dart';
import '../widgets/destination_screen.dart';
import '../widgets/section_banner.dart';

class RotationScreen extends StatelessWidget {
  const RotationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('4. Rotation Transition')),
      body: Column(
        children: [
          const SectionBanner(
            title: 'Concept',
            explanation:
                'A pure rotation from 0.75 to 1.0 turns. Notice the '
                'corners briefly clip outside the screen bounds — this is '
                'exactly why rotation is rarely used alone in production; '
                'see Module 5 for a more usable pairing.',
          ),
          const Spacer(),
          Center(
            child: FilledButton.icon(
              icon: const Icon(Icons.rotate_right),
              label: const Text('Push with Rotation'),
              onPressed: () => Navigator.push(
                context,
                RotationRoute(
                  page: const DestinationScreen(
                    title: 'Rotated In',
                    subtitle: 'RotationTransition, 0.75 → 1.0 turns',
                    color: Color(0xFFD63031),
                    icon: Icons.sync,
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
