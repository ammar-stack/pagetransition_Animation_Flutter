import 'package:flutter/material.dart';
import '../routes/scale_route.dart';
import '../widgets/destination_screen.dart';
import '../widgets/section_banner.dart';

class ScaleScreen extends StatelessWidget {
  const ScaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3. Scale Transition')),
      body: Column(
        children: [
          const SectionBanner(
            title: 'Concept',
            explanation:
                'ScaleTransition zooms the page in from a point of origin '
                '(`alignment`). Curves.easeOutBack adds a slight overshoot '
                'for a "pop" feel — good for modals and dialogs.',
          ),
          const Spacer(),
          Center(
            child: FilledButton.icon(
              icon: const Icon(Icons.zoom_in),
              label: const Text('Push with Scale'),
              onPressed: () => Navigator.push(
                context,
                ScaleRoute(
                  page: const DestinationScreen(
                    title: 'Scaled In',
                    subtitle: 'ScaleTransition + Curves.easeOutBack',
                    color: Color(0xFFE84393),
                    icon: Icons.zoom_in_map,
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
