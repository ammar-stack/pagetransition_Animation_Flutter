import 'package:flutter/material.dart';
import '../widgets/destination_screen.dart';
import '../widgets/section_banner.dart';

/// MODULE 6 — CURVE LAB (custom control)
///
/// Duration and Curve are the two levers that change a transition's
/// "feel" the most, independent of which properties are animated. This
/// screen builds a PageRouteBuilder INLINE (rather than a fixed reusable
/// class) specifically so duration/curve can vary per tap.
class CurveLabScreen extends StatefulWidget {
  const CurveLabScreen({super.key});

  @override
  State<CurveLabScreen> createState() => _CurveLabScreenState();
}

class _CurveLabScreenState extends State<CurveLabScreen> {
  double _durationMs = 400;
  Curve _curve = Curves.easeInOut;

  final Map<String, Curve> _curveOptions = {
    'easeInOut': Curves.easeInOut,
    'bounceOut': Curves.bounceOut,
    'elasticOut': Curves.elasticOut,
    'linear': Curves.linear,
  };

  void _push() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: _durationMs.round()),
        pageBuilder: (context, animation, secondaryAnimation) => const DestinationScreen(
          title: 'Custom Curve',
          subtitle: 'Duration and curve chosen at runtime',
          color: Color(0xFF6C5CE7),
          icon: Icons.tune,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                .animate(CurvedAnimation(parent: animation, curve: _curve)),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('6. Curve Lab')),
      body: Column(
        children: [
          const SectionBanner(
            title: 'Concept',
            explanation:
                'Same SlideTransition every time — only duration and curve '
                'change. Try bounceOut vs linear back-to-back to feel how '
                'much curve choice affects perceived polish.',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Text('Duration: ${_durationMs.round()} ms'),
                Slider(
                  value: _durationMs,
                  min: 150,
                  max: 1200,
                  divisions: 21,
                  label: '${_durationMs.round()} ms',
                  onChanged: (v) => setState(() => _durationMs = v),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: _curveOptions.entries.map((entry) {
                    final selected = _curve == entry.value;
                    return ChoiceChip(
                      label: Text(entry.key),
                      selected: selected,
                      onSelected: (_) => setState(() => _curve = entry.value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: FilledButton.icon(
              icon: const Icon(Icons.play_arrow),
              label: const Text('Push with These Settings'),
              onPressed: _push,
            ),
          ),
        ],
      ),
    );
  }
}
