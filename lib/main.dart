import 'package:choppnahorabh/components/animation_widget.dart';
import 'package:choppnahorabh/page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'Provider/login_notfier.dart';

void main() {
  // Bloqueia a orientação para modo retrato
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Bloqueia a tela em modo retrato
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginState(), // Provedor de estado
      child: MaterialApp(
        home: BeerLoadingAnimation(),
      ),
    );
  }
}
