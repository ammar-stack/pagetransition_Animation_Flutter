import 'package:flutter/material.dart';
import '../routes/combined_routes.dart';
import '../widgets/destination_screen.dart';
import '../widgets/section_banner.dart';

class CombinedScreen extends StatelessWidget {
  const CombinedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('5. Combined Transitions')),
      body: Column(
        children: [
          const SectionBanner(
            title: 'Concept',
            explanation:
                'Multiple TransitionWidgets nest inside one another, all '
                'driven by the SAME CurvedAnimation — that shared timing '
                'is what keeps a combined effect feeling like one motion '
                'instead of several separate ones.',
          ),
          const Spacer(),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: [
              FilledButton.icon(
                icon: const Icon(Icons.layers),
                label: const Text('Fade + Slide'),
                onPressed: () => Navigator.push(
                  context,
                  FadeSlideRoute(
                    page: const DestinationScreen(
                      title: 'Fade + Slide',
                      subtitle: 'Same CurvedAnimation drives both effects',
                      color: Color(0xFF00CEC9),
                      icon: Icons.layers,
                    ),
                  ),
                ),
              ),
              FilledButton.icon(
                icon: const Icon(Icons.threed_rotation),
                label: const Text('Scale + Rotation'),
                onPressed: () => Navigator.push(
                  context,
                  ScaleRotationRoute(
                    page: const DestinationScreen(
                      title: 'Scale + Rotation',
                      subtitle: 'A "pop open" effect — rotation alone rarely works',
                      color: Color(0xFF2D3436),
                      icon: Icons.threed_rotation,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
