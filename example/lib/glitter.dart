import 'dart:math';

import 'package:flutter/material.dart';

import 'particle_shape.dart';

class Glitter {
  double x;
  double y;
  double size;
  double speedX;
  double speedY;
  Color color;
  double lifespan;

  Glitter(
    this.x,
    this.y,
    Random random,
    double speed,
    List<Color> colors,
    bool isRandomColor,
    this.lifespan,
  )   : size = random.nextDouble() * 5 + 2,
        speedX = random.nextDouble() * speed - speed / 2,
        speedY = random.nextDouble() * speed - speed / 2,
        color = isRandomColor
            ? Color.fromRGBO(
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256),
                random.nextDouble(),
              )
            : colors[random.nextInt(colors.length)];

  void update(bool applyGravity) {
    x += speedX;
    y += speedY;
    if (applyGravity) {
      speedY += 0.1;
    }
    if (size > 0.2) size -= 0.1;
  }

  void draw(Canvas canvas, ParticleShape shape) {
    final paint = Paint()..color = color;
    if (shape == ParticleShape.circle) {
      canvas.drawCircle(Offset(x, y), size, paint);
    } else if (shape == ParticleShape.square) {
      canvas.drawRect(Rect.fromCenter(center: Offset(x, y), width: size, height: size), paint);
    } else if (shape == ParticleShape.triangle) {
      final path = Path()
        ..moveTo(x, y - size)
        ..lineTo(x - size, y + size)
        ..lineTo(x + size, y + size)
        ..close();
      canvas.drawPath(path, paint);
    } else if (shape == ParticleShape.all) {
      canvas.drawCircle(Offset(x, y), size, paint);
      canvas.drawRect(Rect.fromCenter(center: Offset(x, y), width: size, height: size), paint);
      final path = Path()
        ..moveTo(x, y - size)
        ..lineTo(x - size, y + size)
        ..lineTo(x + size, y + size)
        ..close();
      canvas.drawPath(path, paint);
    }
  }
}
