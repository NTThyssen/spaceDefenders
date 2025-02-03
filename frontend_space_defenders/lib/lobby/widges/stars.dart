import 'package:flutter/material.dart';
import 'dart:math';

class StarryBackground extends StatefulWidget {
  @override
  _StarryBackgroundState createState() => _StarryBackgroundState();
}

class _StarryBackgroundState extends State<StarryBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Offset> _stars;
  late List<double> _starRadii;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
      value: 1.0,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
          _generateStars();
        }
      });

    _generateStars();
    _controller.reverse();
  }

  void _generateStars() {
    final Random random = Random();
    const int numberOfStars = 100;
    _stars = List.generate(numberOfStars, (index) {
      return Offset(random.nextDouble(), random.nextDouble());
    });
    _starRadii = List.generate(numberOfStars, (index) {
      return random.nextDouble() * 2;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter:
              StarryBackgroundPainter(_stars, _starRadii, _controller.value),
          child: Container(),
        );
      },
    );
  }
}

class StarryBackgroundPainter extends CustomPainter {
  final List<Offset> stars;
  final List<double> starRadii;
  final double opacity;

  StarryBackgroundPainter(this.stars, this.starRadii, this.opacity);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black.withOpacity(opacity)
      ..style = PaintingStyle.fill;

    // Draw the background
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Draw stars
    paint.color = Colors.white.withOpacity(opacity);
    for (int i = 0; i < stars.length; i++) {
      final position = Offset(
        stars[i].dx * size.width,
        stars[i].dy * size.height,
      );
      canvas.drawCircle(position, starRadii[i], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint to animate
  }
}

class Star {
  final double dx;
  final double dy;
  final double speed;

  Star(this.dx, this.dy, this.speed);
}

class HyperspaceBackgroundPainter extends CustomPainter {
  final List<Star> stars;
  final double animationValue;

  HyperspaceBackgroundPainter(this.stars, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // Draw the background
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Draw stars
    paint.color = Colors.white;
    for (final star in stars) {
      final double x = star.dx * size.width;
      final double y = star.dy * size.height;
      final double radius = 1.0 + star.speed * animationValue * 2;
      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint to animate
  }
}
