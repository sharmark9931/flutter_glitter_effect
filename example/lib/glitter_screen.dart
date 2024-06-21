import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'glitter.dart';
import 'glitter_painter.dart';
import 'particle_shape.dart';

class GlitterScreen extends StatefulWidget {
  final int numberOfParticles;
  final double speedOfParticles;
  final double width;
  final double height;
  final List<Color> particleColors;
  final bool isRandomColor;
  final ParticleShape particleShape;
  final double particleLifespan;
  final bool applyGravity;
  final int initialBurst;
  final int trailLength;

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
        assert(speedOfParticles <= 20.0, 'speedOfParticles must not exceed 20.0');

  @override
  State<GlitterScreen> createState() => _GlitterScreenState();
}

class _GlitterScreenState extends State<GlitterScreen> {
  List<Glitter> glitters = [];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {
        for (var glitter in glitters) {
          glitter.update(widget.applyGravity);
        }
        glitters.removeWhere((glitter) => glitter.size <= 0.2);
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            final x = details.localPosition.dx;
            final y = details.localPosition.dy;
            createGlitter(x, y);
          });
        },
        onPanStart: (details) {
          setState(() {
            final x = details.localPosition.dx;
            final y = details.localPosition.dy;
            createInitialBurst(x, y);
          });
        },
        child: CustomPaint(
          painter: GlitterPainter(glitters, widget.particleShape),
          size: Size(widget.width, widget.height),
        ),
      ),
    );
  }

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
