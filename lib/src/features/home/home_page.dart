import 'package:flutter/material.dart';
import 'package:vagas_esports/src/shared/widgets/button_primary/button_primary.dart';
import 'package:vagas_esports/src/shared/widgets/button_secondary/button_secondary.dart';
import 'package:vagas_esports/src/shared/widgets/input_text/input_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          children: [
            InputText(label: 'label', hint: 'hint'),
            ButtonPrimary(
              text: "Cadastre-se",
              onPressed: () {
                print('Cadastre');
              },
            ),
            ButtonSecondary(
              text: "Esqueceu a senha?",
              onPressed: () {
                print('Esqueceu');
              },
            )
          ],
        ),
      ),
    );
  }
}
