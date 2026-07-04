import 'package:flutter/material.dart';
import '../widgets/module_card.dart';
import 'fade_screen.dart';
import 'slide_screen.dart';
import 'scale_screen.dart';
import 'rotation_screen.dart';
import 'combined_screen.dart';
import 'curve_lab_screen.dart';
import 'depth_navigation_screen.dart';
import '../routes/depth_push_route.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Transitions Playground'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              'Seven modules covering PageRouteBuilder from a single fade '
              'up through coordinated multi-screen depth navigation.',
              style: TextStyle(color: Colors.grey.shade700, height: 1.4),
            ),
          ),
          ModuleCard(
            number: '1',
            title: 'Fade Transition',
            subtitle: 'The simplest custom PageRouteBuilder',
            icon: Icons.blur_on,
            color: const Color(0xFF6C5CE7),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FadeScreen())),
          ),
          ModuleCard(
            number: '2',
            title: 'Slide Transition',
            subtitle: 'Left / right / top / bottom, one class',
            icon: Icons.swap_horiz,
            color: const Color(0xFF0984E3),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SlideScreen())),
          ),
          ModuleCard(
            number: '3',
            title: 'Scale Transition',
            subtitle: 'Zoom with overshoot',
            icon: Icons.zoom_in,
            color: const Color(0xFFE84393),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ScaleScreen())),
          ),
          ModuleCard(
            number: '4',
            title: 'Rotation Transition',
            subtitle: 'Pure rotation, and why it\'s rarely used alone',
            icon: Icons.rotate_right,
            color: const Color(0xFFD63031),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RotationScreen())),
          ),
          ModuleCard(
            number: '5',
            title: 'Combined Transitions',
            subtitle: 'Fade+Slide and Scale+Rotation',
            icon: Icons.layers,
            color: const Color(0xFF00CEC9),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CombinedScreen())),
          ),
          ModuleCard(
            number: '6',
            title: 'Curve Lab',
            subtitle: 'Dynamic duration + curve control',
            icon: Icons.tune,
            color: const Color(0xFFFDCB6E),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CurveLabScreen())),
          ),
          ModuleCard(
            number: '7',
            title: 'Depth Navigation',
            subtitle: 'secondaryAnimation across a 3-screen chain',
            icon: Icons.layers_clear,
            color: const Color(0xFF2D3436),
            onTap: () =>
                Navigator.push(context, DepthPushRoute(page: const DepthScreenOne())),
          ),
        ],
      ),
    );
  }
}
