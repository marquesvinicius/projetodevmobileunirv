import 'package:flutter/material.dart';

class BemVindoWidget extends StatelessWidget {
  const BemVindoWidget({super.key});

    @override
    Widget build(BuildContext context) {
        return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
                children: [
                    Text(
                        'Bem vindo ao Unirv - Graduacao',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                        ),
                    ),
                    SizedBox(height: 10),
                    Text(
                        'Sistema de Graduação',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                        ),
                    ),
                ],
            ),
        );
    }
}