// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:calculo_do_imc/Taxa_imc/Taxa_imc.dart';
import 'package:calculo_do_imc/Imagem/imagem.dart';

class Calculo_imc extends StatefulWidget {
  const Calculo_imc({Key? key}) : super(key: key);

  State<Calculo_imc> createState() => _Calculo_imcState();
}

class _Calculo_imcState extends State<Calculo_imc> {
  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();

  String current_image = AssetImageLocal.normal;

  void Calculo_imc() {
    double altura = double.parse(alturaController.text);
    double peso = double.parse(pesoController.text);
    double resultado = peso / (altura * altura);
    String imageToShow = AssetImageLocal.normal;

    if (resultado < Taxaimc.abaixoPeso)
      imageToShow = AssetImageLocal.magreza;
    else if (Taxaimc.abaixoPeso < resultado && resultado < Taxaimc.pesoNormal)
      imageToShow = AssetImageLocal.normal;
    else if (Taxaimc.pesoNormal < resultado && resultado < Taxaimc.sobrePeso)
      imageToShow = AssetImageLocal.excesso;
    else if (Taxaimc.sobrePeso < resultado && resultado < Taxaimc.obesidade)
      imageToShow = AssetImageLocal.obesidade;
    else
      imageToShow = AssetImageLocal.obesidade2;

    setState(() {
      current_image = imageToShow;
    });
  }

  @override
  void dispose() {
    alturaController.dispose();
    pesoController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false, // o teclado sobre.
        appBar: AppBar(
          title: Center(
            child: Text("IMC"),
          ),
        ),
        body: Column(
          children: [
            Flexible(
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Column(
                  children: [
                    TextField(
                      controller: alturaController,
                      keyboardType: TextInputType.number, // teclado só numérico
                      decoration: InputDecoration(
                        hintText: 'Altura',
                        labelText: 'Insira sua Altura: ',
                      ),
                    ),
                    TextField(
                      controller: pesoController,
                      keyboardType: TextInputType.number, // teclado só numérico
                      decoration: InputDecoration(
                        hintText: 'Peso',
                        labelText: 'Insira seu peso: ',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: Calculo_imc,
                        child: Text("Calcular IMC"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Center(
                child: Image.asset(
                  'images/' + current_image,
                  scale: 0.75,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
