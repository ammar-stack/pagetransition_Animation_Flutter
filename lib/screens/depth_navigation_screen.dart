import 'package:flutter/material.dart';
import '../routes/depth_push_route.dart';
import '../widgets/section_banner.dart';

/// MODULE 7 — DEPTH NAVIGATION (advanced: secondaryAnimation)
///
/// A chain of three screens, ALL pushed with DepthPushRoute. Push
/// forward through all three and watch each screen shrink slightly as
/// the next one covers it — that shrink is driven by THIS screen's own
/// secondaryAnimation, not by anything the next screen does.
class DepthScreenOne extends StatelessWidget {
  const DepthScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6C5CE7),
      body: SafeArea(
        child: Column(
          children: [
            const SectionBanner(
              title: 'Concept',
              explanation:
                  'Push through Screen 1 → 2 → 3. Each screen recedes '
                  '(scales + dims) as the next one slides on top — that '
                  'effect comes from THIS screen\'s secondaryAnimation, '
                  'set up when it was pushed, not from the new screen.',
            ),
            const Spacer(),
            const Center(
              child: Text('Screen 1', style: TextStyle(color: Colors.white, fontSize: 28)),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: FilledButton(
                onPressed: () => Navigator.push(
                  context,
                  DepthPushRoute(page: const DepthScreenTwo()),
                ),
                child: const Text('Push Screen 2 →'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DepthScreenTwo extends StatelessWidget {
  const DepthScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00B894),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            const Spacer(),
            const Center(
              child: Text('Screen 2', style: TextStyle(color: Colors.white, fontSize: 28)),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: FilledButton(
                onPressed: () => Navigator.push(
                  context,
                  DepthPushRoute(page: const DepthScreenThree()),
                ),
                child: const Text('Push Screen 3 →'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DepthScreenThree extends StatelessWidget {
  const DepthScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE17055),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            const Spacer(),
            const Center(
              child: Text('Screen 3\n(end of chain)',
                  textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 28)),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(foregroundColor: Colors.white, side: const BorderSide(color: Colors.white)),
                onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                child: const Text('Back to Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
