import 'dart:async';
import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/km_logo.dart';
import 'auth/phone_login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _showCredit = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();

    // Affiche le crédit après une courte pause
    Timer(const Duration(milliseconds: 900), () {
      if (mounted) setState(() => _showCredit = true);
    });

    Timer(const Duration(milliseconds: 3800), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const PhoneLoginScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KMColors.background,
      body: Stack(
        children: [
          Center(
            child: ScaleTransition(
              scale: CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const KMLogo(size: 130),
                  const SizedBox(height: 24),
                  ShaderMask(
                    shaderCallback: (bounds) => KMColors.logoGradient.createShader(bounds),
                    child: const Text(
                      'KONATE MEDIA CHAT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Discutez. Partagez. Restez connectés.',
                    style: TextStyle(color: KMColors.textSecondary, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 50,
            child: AnimatedOpacity(
              opacity: _showCredit ? 1 : 0,
              duration: const Duration(milliseconds: 600),
              child: const Column(
                children: [
                  Text(
                    'Cette application est créée par',
                    style: TextStyle(color: KMColors.textSecondary, fontSize: 11.5),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 2),
                  Text(
                    'EL PROFESSOR',
                    style: TextStyle(
                      color: KMColors.primaryGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    '07 20 20 13 36',
                    style: TextStyle(color: KMColors.textSecondary, fontSize: 11.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
