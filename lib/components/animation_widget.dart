import 'package:choppnahorabh/page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BeerLoadingAnimation extends StatefulWidget {
  @override
  BeerLoadingAnimationState createState() => BeerLoadingAnimationState();
}

class BeerLoadingAnimationState extends State<BeerLoadingAnimation> {
  double _beerHeight = 0.0;

  @override
  void initState() {
    super.initState();

    // Simula o carregamento e redireciona após 7 segundos
    Future.delayed(Duration(seconds: 3), () {
      // Garante que o redirecionamento ocorre após a animação ser completada
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Imagem do copo Lagoinha vazio (tamanho aumentado)
            Image.asset(
              'assets/copolagoinha.png',
              width: 300, // Aumenta o tamanho do copo
              height: 400, // Aumenta a altura do copo
              fit: BoxFit.cover,
            ),

            // ClipPath para garantir que o líquido fique dentro do copo Lagoinha
            Positioned(
              bottom: 90,
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: Duration(seconds: 2), // Tempo total da animação (5 segundos)
                builder: (context, value, child) {
                  return ClipPath(
                    clipper: BeerClipper(beerHeight: value),
                    child: Container( 
                      width: 160, // Aumenta o tamanho do líquido
                      height: 285 * value, // Altura da cerveja aumentando
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(187, 255, 194, 40),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(
                        'assets/espuma.png',
                        width: 160, // Aumenta o tamanho da espuma
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Texto de carregando no topo (aumentado para acompanhar o copo)
            Positioned(
              top: 10,
              child: Image.asset('assets/logo/logo.png', height: 60,), // Aumenta o tamanho do logo
            ),
          ],
        ).animate().fadeIn(),
      ),
    );
  }
}

// Define o formato do líquido da cerveja e mantém o formato trapezoidal na metade e topo
class BeerClipper extends CustomClipper<Path> {
  final double beerHeight;

  BeerClipper({required this.beerHeight});

  @override
  Path getClip(Size size) {
    Path path = Path();

    // Base mais estreita
    path.moveTo(size.width * 0.2, size.height); // Lado esquerdo da base
    path.lineTo(size.width * 0.8, size.height); // Lado direito da base

    // Se o líquido estiver abaixo da metade, mantém a subida natural
    if (beerHeight < 0.8) {
      path.lineTo(size.width * 0.8, size.height * (1 - beerHeight)); // Lado direito subindo
      path.lineTo(size.width * 0.2, size.height * (1 - beerHeight)); // Lado esquerdo subindo
    } else {
      // A partir da metade ou no topo, mantém o formato trapezoidal
      path.lineTo(size.width, size.height * 0.2); // Lado direito do trapezoide
      path.lineTo(0, size.height * 0.2); // Lado esquerdo do trapezoide
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true; // Sem necessidade de reclipping neste caso
  }
}
