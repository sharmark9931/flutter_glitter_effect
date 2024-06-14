# Flutter Glitter Effect

A Flutter package for creating customizable glitter effects, perfect for adding interactive and visually appealing animations to your Flutter applications. Glitter will apply to your gesture.

![Flutter Glitter Effect Demo](https://raw.githubusercontent.com/sharmark9931/flutter_glitter_effect/main/flutter_glitter_effect.gif)

## Features

- Create glitter effects with customizable parameters such as number of particles, speed, colors, shapes, and more.
- Supports different particle shapes: circle, square, triangle.
- Option to apply gravity to particles.
- Configure initial burst of particles on user interaction.
- Customize particle lifespan and trail length.

## Getting Started

### Installation
To use this package, add `flutter_glitter_effect` as a dependency in your `pubspec.yaml` file:
```yaml
dependencies:
  flutter_glitter_effect: ^0.0.1  # Replace with the latest version
```
Or run
```bash
  flutter pub add flutter_glitter_effect
```

Then, run the following command to install:
```bash
 flutter pub get
```
Import the package where you need to use it:
Example:
```dart
import 'package:flutter/material.dart';
import 'package:flutter_glitter_effect/flutter_glitter_effect.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Glitter Effect Demo')),
        body: Center(
          child: GlitterScreen(
            numberOfParticles: 10,
            speedOfParticles: 3.0,
            particleColors: [Colors.red, Colors.green, Colors.blue],
            particleShape: ParticleShape.circle,
            applyGravity: false,
            initialBurst: 10,
            trailLength: 5,
          ),
        ),
      ),
    );
  }
}
```

### API Details
```
numberOfParticles: Number of particles emitted per interaction.
speedOfParticles: Speed of particles, with a maximum of 20.0.
particleColors: List of colors for particles.
particleShape: Shape of particles (circle, square, triangle).
applyGravity: Whether to apply gravity to particles.
initialBurst: Number of particles emitted on initial user interaction.
trailLength: Length of particle trail.
```

### Notes:

This comprehensive `README.md` document covers installation instructions, usage examples, API details, additional information, and licensing for your `flutter_glitter_effect` package. This package is licenced under MIT licence.
