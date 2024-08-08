import 'package:flutter/material.dart';

class MouthWidget extends StatefulWidget {
  final Color color;
  const MouthWidget({super.key, required this.color});

  @override
  State<MouthWidget> createState() => _MouthWidgetState();
}

class _MouthWidgetState extends State<MouthWidget> {
  late Color _oldColor;

  @override
  void initState() {
    _oldColor = widget.color;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MouthWidget oldWidget) {
    _oldColor = oldWidget.color;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 400),
      tween: ColorTween(begin: _oldColor, end: widget.color),
      builder: (_, color, __) {
        return CustomPaint(
          size: const Size(120, 50),
          painter: ConcavePainter(color: color!),
        );
      },
    );
  }
}

class ConcavePainter extends CustomPainter {
  final Color color;

  ConcavePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 30.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();

    path.moveTo(size.width * 0.15, size.height * 0.8);

    path.quadraticBezierTo(
      size.width / 2,
      0,
      size.width * 0.85,
      size.height * 0.8,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
