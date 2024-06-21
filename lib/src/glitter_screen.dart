import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'glitter.dart';

/// Import the Glitter class for particle representation
import 'glitter_painter.dart';

/// Import the GlitterPainter for custom painting

/// Enum to define different shapes for particles
enum ParticleShape { circle, square, triangle, all }

/// Widget for displaying a screen with customizable glitter effects.
class GlitterScreen extends StatefulWidget {
  /// Number of particles emitted per interaction.
  final int numberOfParticles;

  /// Speed of particles.
  final double speedOfParticles;

  /// Width of the CustomPaint widget.
  final double width;

  /// Height of the CustomPaint widget.
  final double height;

  /// List of colors for particles.
  final List<Color> particleColors;

  /// Flag to use random colors if true, else use particleColors.
  final bool isRandomColor;

  /// Shape of particles (circle, square, triangle, all).
  final ParticleShape particleShape;

  /// Lifespan of each particle.
  final double particleLifespan;

  /// Flag to apply gravity to particles.
  final bool applyGravity;

  /// Number of particles emitted on initial user interaction.
  final int initialBurst;

  /// Length of particle trail.
  final int trailLength;

  /// Constructor with default parameter values.
  const GlitterScreen({
    super.key,
    this.numberOfParticles = 5,
    this.speedOfParticles = 3.0,
    this.width = double.infinity,
    this.height = double.infinity,
    this.particleColors = const [Colors.red, Colors.green, Colors.blue],
    this.isRandomColor = true,
    this.particleShape = ParticleShape.circle,
    this.particleLifespan = 2.0,
    this.applyGravity = false,
    this.initialBurst = 10,
    this.trailLength = 5,
  })  : assert(numberOfParticles <= 10, 'numberOfParticles must not exceed 10'),
        assert(
            speedOfParticles <= 20.0, 'speedOfParticles must not exceed 20.0');

  @override
  State<GlitterScreen> createState() => _GlitterScreenState();
}

/// State class for the GlitterScreen widget.
class _GlitterScreenState extends State<GlitterScreen> {
  /// List to hold the current active glitter particles.
  List<Glitter> glitters = [];

  /// Timer for updating the particles at regular intervals.
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    /// Initialize the timer to update particle positions and handle removal.
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {
        for (var glitter in glitters) {
          glitter.update(widget.applyGravity);

          /// Update each glitter particle.
        }
        glitters.removeWhere((glitter) => glitter.size <= 0.2);

        /// Remove particles that are too small.
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();

    /// Cancel the timer when disposing of the widget.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        /// Gesture detector to track user interactions for emitting particles.
        onPanUpdate: (details) {
          setState(() {
            final x = details.localPosition.dx;

            /// X coordinate of the pointer.
            final y = details.localPosition.dy;

            /// Y coordinate of the pointer.
            createGlitter(x, y);

            /// Emit particles at the pointer position.
          });
        },
        onPanStart: (details) {
          setState(() {
            final x = details.localPosition.dx;

            /// X coordinate of the pointer.
            final y = details.localPosition.dy;

            /// Y coordinate of the pointer.
            createInitialBurst(x, y);

            /// Emit initial burst of particles on touch start.
          });
        },
        child: CustomPaint(
          painter: GlitterPainter(glitters, widget.particleShape),

          /// Painter for rendering particles.
          size: Size(widget.width, widget.height),

          /// Size of the CustomPaint widget.
        ),
      ),
    );
  }

  /// Method to create particles at a specific position.
  void createGlitter(double x, double y) {
    final random = Random();
    for (int i = 0; i < widget.numberOfParticles; i++) {
      glitters.add(Glitter(
        x,
        y,
        random,
        widget.speedOfParticles,
        widget.particleColors,
        widget.isRandomColor,
        widget.particleLifespan,
      ));
    }
  }

  /// Method to create an initial burst of particles at a specific position.
  void createInitialBurst(double x, double y) {
    final random = Random();
    for (int i = 0; i < widget.initialBurst; i++) {
      glitters.add(Glitter(
        x,
        y,
        random,
        widget.speedOfParticles,
        widget.particleColors,
        widget.isRandomColor,
        widget.particleLifespan,
      ));
    }
  }
}
