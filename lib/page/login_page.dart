import 'package:choppnahorabh/components/login_buttons_widget.dart';
import 'package:choppnahorabh/components/login_text_widget.dart';
import 'package:choppnahorabh/components/logo_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( 
        child: Container(
          height: MediaQuery.of(context).size.height, // Ocupa a altura total da tela
          alignment: Alignment.center, // Centraliza vertical e horizontalmente
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              LogoImageWidget().animate().fadeIn(),
             // Espaço entre os elementos
              LoginTextWidget().animate().fadeIn(),
               // Espaço entre os elementos
              LoginButtonsWidget().animate().fadeIn(),
            ],
          ),
        ),
      ),
    );
  }
}
