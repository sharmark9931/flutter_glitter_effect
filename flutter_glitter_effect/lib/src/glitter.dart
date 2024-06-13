import 'dart:math';
import 'package:flutter/material.dart';

import '../flutter_glitter_effect.dart';

/// Import the ParticleShape enum for particle rendering options

/// Represents a glitter particle with position, size, speed, color, and lifespan.
class Glitter {
  double x;

  /// X-coordinate of the particle's current position.
  double y;

  /// Y-coordinate of the particle's current position.
  double size;

  /// Diameter of the particle.
  double speedX;

  /// Horizontal speed of the particle.
  double speedY;

  /// Vertical speed of the particle.
  Color color;

  /// Color of the particle.
  double lifespan;

  /// Lifespan of the particle before it disappears.

  /// Constructor for Glitter.
  ///
  /// Initializes the particle with initial position [x] and [y], a [Random] instance for randomness,
  /// [speed] for initial speed, a list of [colors] for particle color options, [isRandomColor] to
  /// determine if color should be random, and [lifespan] to determine how long the particle stays visible.
  Glitter(
    this.x,
    this.y,
    Random random,
    double speed,
    List<Color> colors,
    bool isRandomColor,
    this.lifespan,
  )   : size = random.nextDouble() * 5 + 2,

        /// Randomly initializes size between 2 and 7.
        speedX = random.nextDouble() * speed - speed / 2,

        /// Randomly initializes horizontal speed.
        speedY = random.nextDouble() * speed - speed / 2,

        /// Randomly initializes vertical speed.
        color = isRandomColor
            ? Color.fromRGBO(
                /// Randomly generates a color if isRandomColor is true.
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256),
                random.nextDouble(),
              )
            : colors[random.nextInt(colors.length)];

  /// Picks a random color from provided colors if isRandomColor is false.

  /// Updates the position and size of the particle.
  ///
  /// Applies gravity if [applyGravity] is true, reducing the vertical speed over time.
  /// Decreases the particle size gradually until it reaches 0.2, after which it removes the particle from rendering.
  void update(bool applyGravity) {
    x += speedX;

    /// Update horizontal position based on horizontal speed.
    y += speedY;

    /// Update vertical position based on vertical speed.
    if (applyGravity) {
      speedY += 0.1;

      /// Apply gravity effect by increasing vertical speed.
    }
    if (size > 0.2) size -= 0.1;

    /// Reduce particle size gradually over time until it reaches 0.2.
  }

  /// Draws the particle on the canvas based on its current shape [shape].
  ///
  /// Uses the provided [canvas] to render the particle using its [color] and [size].
  void draw(Canvas canvas, ParticleShape shape) {
    final paint = Paint()..color = color;

    /// Create a Paint instance with the current particle color.
    if (shape == ParticleShape.circle) {
      canvas.drawCircle(Offset(x, y), size, paint);

      /// Draw a circle at current position with the specified size.
    } else if (shape == ParticleShape.square) {
      canvas.drawRect(Rect.fromCenter(center: Offset(x, y), width: size, height: size), paint);

      /// Draw a square at current position with the specified size.
    } else if (shape == ParticleShape.triangle) {
      final path = Path()
        ..moveTo(x, y - size)
        ..lineTo(x - size, y + size)
        ..lineTo(x + size, y + size)
        ..close();

      /// Create a triangular path at current position with the specified size.
      canvas.drawPath(path, paint);

      /// Draw a triangle on the canvas.
    } else if (shape == ParticleShape.all) {
      canvas.drawCircle(Offset(x, y), size, paint);

      /// Draw a circle.
      canvas.drawRect(Rect.fromCenter(center: Offset(x, y), width: size, height: size), paint);

      /// Draw a square.
      final path = Path()
        ..moveTo(x, y - size)
        ..lineTo(x - size, y + size)
        ..lineTo(x + size, y + size)
        ..close();

      /// Create and draw a triangle.
      canvas.drawPath(path, paint);
    }
  }
}
