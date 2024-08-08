import 'package:flutter/material.dart';

class EyesWidget extends StatelessWidget {
  final Color color;
  final double height;
  final double width;

  const EyesWidget({
    super.key,
    required this.color,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: color,
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: color,
          ),
        ),
      ],
    );
  }
}
