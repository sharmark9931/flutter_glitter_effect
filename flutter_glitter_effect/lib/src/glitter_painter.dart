import 'package:flutter/material.dart';

import '../flutter_glitter_effect.dart';

/// Import the Glitter class for particle representation

/// Custom painter for rendering glitter particles on a canvas.
class GlitterPainter extends CustomPainter {
  /// List of glitter particles to render.
  final List<Glitter> glitters;

  /// Shape of the particles to render (circle, square, triangle, all).
  final ParticleShape particleShape;

  /// Constructor for GlitterPainter.
  ///
  /// Initializes with the list of [glitters] to render and the [particleShape] to use.
  GlitterPainter(this.glitters, this.particleShape);

  @override
  void paint(Canvas canvas, Size size) {
    for (var glitter in glitters) {
      glitter.draw(canvas, particleShape);

      /// Draw each glitter particle on the canvas.
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;

    /// Always repaint to update with new particle positions.
  }
}
