import 'package:flutter/material.dart';

import 'glitter_screen.dart';
import 'particle_shape.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mouse Cursor Glitter Effect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const GlitterScreen(
        numberOfParticles: 10,
        speedOfParticles: 3.0,
        width: 400,
        height: 200,
        particleColors: [Colors.red, Colors.grey, Colors.greenAccent],
        isRandomColor: true,
        particleShape: ParticleShape.circle,
        particleLifespan: 2.0,
        applyGravity: false,
        initialBurst: 10,
        trailLength: 5,
        outerBoxBorderWidth: 1,
        outerBoxColor: Colors.greenAccent,
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            'Flutter Glitter Effect',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
