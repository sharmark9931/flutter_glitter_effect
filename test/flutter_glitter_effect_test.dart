import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_glitter_effect/flutter_glitter_effect.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GlitterScreen Tests', () {
    testWidgets('Test glitter creation on pan update', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: GlitterScreen(
          numberOfParticles: 5,
          speedOfParticles: 3.0,
          width: 400,
          height: 400,
          particleColors: [Colors.red, Colors.green, Colors.blue],
          isRandomColor: true,
          particleShape: ParticleShape.circle,
          particleLifespan: 2.0,
          applyGravity: false,
          initialBurst: 10,
          trailLength: 5,
        ),
      ));

      await tester.drag(find.byType(GestureDetector), const Offset(200, 200));

      await tester.pumpAndSettle();

      expect(find.byType(CustomPaint), findsOneWidget);
      // Add more specific assertions based on your package's expected behavior
    });
  });

  group('GlitterPainter Tests', () {
    test('Test painting circle particles', () {});

    // Add more tests for different shapes (square, triangle) if supported
  });

  group('Glitter Tests', () {
    test('Test glitter update method', () {
      final random = Random();
      final glitter = Glitter(
        100,
        100,
        random,
        3.0,
        [Colors.red, Colors.green, Colors.blue],
        true,
        2.0,
      );

      glitter.update(false);

      // Add assertions to verify expected behavior after update
      expect(glitter.size, lessThan(5.2)); // Example assertion
    });

    // Add more tests for Glitter class as per its functionality
  });
}
