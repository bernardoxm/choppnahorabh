import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../Provider/login_notfier.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class LoginTextWidget extends StatefulWidget {
  const LoginTextWidget({super.key});

  @override
  State<LoginTextWidget> createState() => _LoginTextWidgetState();
}

class _LoginTextWidgetState extends State<LoginTextWidget> {
  bool _obscureText = true;
  final TextEditingController _controller =
      TextEditingController(text: "+55 "); // Pré-preenche com +55

  @override
  Widget build(BuildContext context) {
    final loginState = Provider.of<LoginState>(context);

    return Column(
      children: [
        // Campos de texto
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(92, 0, 0, 0),width: 0.9,),
            borderRadius: BorderRadius.circular(20),
            
          ),
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'E-mail ou Telefone',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(20),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(92, 0, 0, 0),width: 0.9,),
            borderRadius: BorderRadius.circular(20),
          ),
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Senha',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(20),
              suffixIcon: IconButton(
                icon: Icon(_obscureText
                    ? Icons.remove_red_eye_outlined
                    : Icons.visibility_off_outlined),
                onPressed: () {
                  setState(() {
                    _obscureText =
                        !_obscureText; // Alterna entre mostrar e ocultar a senha
                  });
                },
              ),
            ),
            obscureText: _obscureText,
          ),
        ).animate().fadeIn(),
        SizedBox(height: 10),
       

        // Campos extras apenas se o usuário estiver se registrando
        if (loginState.isNewClient)
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(92, 0, 0, 0),width: 0.9,),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Confirme Sua Senha',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20),
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText
                          ? Icons.remove_red_eye_outlined
                          : Icons.visibility_off_outlined),
                      onPressed: () {
                        setState(() {
                          _obscureText =
                              !_obscureText; // Alterna entre mostrar e ocultar a senha
                        });
                      },
                    ),
                  ),
                  obscureText: _obscureText,
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(92, 0, 0, 0),width: 0.9,),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.phone,
                  inputFormatters: <TextInputFormatter>[
                    PhoneInputFormatter(), // Aplica a formatação automática de telefone
                  ],
                  decoration: InputDecoration(
                    hintText: 'Telefone',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20),
                  ),
                  onChanged: (value) {
                    if (!value.startsWith('+55 ')) {
                      _controller.text = '+55 ';
                      _controller.selection = TextSelection.fromPosition(
                        TextPosition(offset: _controller.text.length),
                      );
                    }
                  },
                ),
              )
            ],
          ).animate().fadeIn(),
      ],
    );
  }
}
