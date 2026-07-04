import 'package:flutter/material.dart';
import '../routes/slide_route.dart';
import '../widgets/destination_screen.dart';
import '../widgets/section_banner.dart';

class SlideScreen extends StatelessWidget {
  const SlideScreen({super.key});

  void _push(BuildContext context, SlideDirection direction, String label) {
    Navigator.push(
      context,
      SlideRoute(
        direction: direction,
        page: DestinationScreen(
          title: label,
          subtitle: 'SlideTransition, direction: $direction',
          color: const Color(0xFF0984E3),
          icon: Icons.swap_horiz,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('2. Slide Transition')),
      body: Column(
        children: [
          const SectionBanner(
            title: 'Concept',
            explanation:
                'One SlideRoute class, four directions via an enum. This '
                'is the transition people expect for forward navigation '
                '(from-right) and its natural reverse for going back.',
          ),
          const Spacer(),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: [
              FilledButton(
                onPressed: () => _push(context, SlideDirection.fromRight, 'From Right'),
                child: const Text('From Right →'),
              ),
              FilledButton(
                onPressed: () => _push(context, SlideDirection.fromLeft, 'From Left'),
                child: const Text('← From Left'),
              ),
              FilledButton(
                onPressed: () => _push(context, SlideDirection.fromBottom, 'From Bottom'),
                child: const Text('↑ From Bottom'),
              ),
              FilledButton(
                onPressed: () => _push(context, SlideDirection.fromTop, 'From Top'),
                child: const Text('↓ From Top'),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
