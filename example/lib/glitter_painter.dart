import 'package:flutter/material.dart';

import 'glitter.dart';
import 'particle_shape.dart';

class GlitterPainter extends CustomPainter {
  final List<Glitter> glitters;
  final ParticleShape particleShape;

  GlitterPainter(this.glitters, this.particleShape);

  @override
  void paint(Canvas canvas, Size size) {
    for (var glitter in glitters) {
      glitter.draw(canvas, particleShape);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
