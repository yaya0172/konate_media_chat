import 'package:flutter/material.dart';
import '../theme.dart';

class KMLogo extends StatelessWidget {
  final double size;
  const KMLogo({super.key, this.size = 120});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size * 0.85,
      child: Container(
        decoration: BoxDecoration(
          gradient: KMColors.logoGradient,
          borderRadius: BorderRadius.circular(size * 0.26),
        ),
        padding: const EdgeInsets.all(4),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(size * 0.22),
          ),
          child: Center(
            child: ShaderMask(
              shaderCallback: (bounds) => KMColors.logoGradient.createShader(bounds),
              child: Text(
                'KM',
                style: TextStyle(
                  fontSize: size * 0.34,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
