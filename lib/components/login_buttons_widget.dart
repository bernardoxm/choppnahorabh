import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/login_notfier.dart';

class LoginButtonsWidget extends StatefulWidget {
  const LoginButtonsWidget({super.key});

  @override
  State<LoginButtonsWidget> createState() => _LoginButtonsWidgetState();
}

class _LoginButtonsWidgetState extends State<LoginButtonsWidget> {
  @override
  Widget build(BuildContext context) {
    final loginState = Provider.of<LoginState>(context);

    return Column(
      children: [
        if (!loginState.isNewClient)
          Row(
            children: [
              SizedBox(
                width: 12,
              ),
              Checkbox(
                value: false,
                onChanged: (_) {},
              ),
              Text('Manter Login'),
              SizedBox(width: 140),
              TextButton(
                onPressed: () {},
                child: Text('Resetar Senha', style:  TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if(!loginState.isNewClient)
            ElevatedButton(
              onPressed: () {
                loginState
                    .setNewClient(false); // Atualiza o estado para "Login"
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 50),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: Colors.amber),
              child: Text('Login',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
            ),
            SizedBox(width: 10),
            if(loginState.isNewClient)
             ElevatedButton(
              onPressed: () {
                loginState
                    .setNewClient(false); // Atualiza o estado para "Login"
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 50),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: Colors.amber),
              child: Text('Cadastrar',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
            ),
            SizedBox(width: 10),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Text('Ou Login com'),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize:
              MainAxisSize.min, // Garante que o botão fique centralizado
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/icons/googleicon.png',
                    height: 40, // Ajuste o tamanho da imagem
                    width: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
         if(!loginState.isNewClient)
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Não possui conta?'),
            TextButton(
              onPressed: () {
                loginState
                    .setNewClient(true); // Atualiza o estado para "Registrar"
              },
              child: Text(
                'Registrar',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ],
        ),
        if(loginState.isNewClient)
         Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Possui conta?'),
            TextButton(
              onPressed: () {
                loginState
                    .setNewClient(false); // Atualiza o estado para "Registrar"
              },
              child: Text(
                'Voltar',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
