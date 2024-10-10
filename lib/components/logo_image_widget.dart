import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LogoImageWidget extends StatelessWidget {
  const LogoImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Image.asset('assets/logo/logo.png'),
                ).animate().fadeIn();
  }
}