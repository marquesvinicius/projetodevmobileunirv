import 'package:flutter/material.dart';

class BotaoAlternarBackground extends StatefulWidget {
  const BotaoAlternarBackground({super.key});

  @override
  State<BotaoAlternarBackground> createState() => _BotaoAlternarBackgroundState();
}

class _BotaoAlternarBackgroundState extends State<BotaoAlternarBackground> {
  bool _isDarkMode = false;

  void _alternarBackground() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.black : Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _isDarkMode ? 'Modo Escuro' : 'Modo Claro',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: _isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _alternarBackground,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isDarkMode ? Colors.white : Colors.black,
                foregroundColor: _isDarkMode ? Colors.black : Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                _isDarkMode ? 'Mudar para Claro' : 'Mudar para Escuro',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
