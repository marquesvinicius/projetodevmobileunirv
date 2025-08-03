import 'package:flutter/material.dart';
import 'package:projetodevmobileunirv/BemVindoWidget.dart';

class PrimeiraTela extends StatefulWidget {
  const PrimeiraTela({super.key});

  @override
  State<PrimeiraTela> createState() => _PrimeiraTelaState();
}

class _PrimeiraTelaState extends State<PrimeiraTela> {
  String? qualquer; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unirv - Graduacao'),
      ),
      body: Column(
        children: [
          BemVindoWidget(),
          SizedBox(height: 20, width: 20),
          Text('qualquer valor: $qualquer'),
          TextField(
            onChanged: (String? value) {
              setState(() {
                qualquer = value;
              });
            },
          ),
        ],
      ),
    );
  }
}