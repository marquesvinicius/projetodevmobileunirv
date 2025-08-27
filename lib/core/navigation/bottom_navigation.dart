import 'package:flutter/material.dart';
import '../widgets/app_bar_custom.dart';
import '../../modules/modulo1/modulo1_screen.dart';
import '../../modules/modulo2/modulo2_screen.dart';
import '../../modules/modulo3/modulo3_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const Modulo1Screen(),
    const Modulo2Screen(),
    const Modulo3Screen(),
  ];

  final List<String> _titles = [
    'Módulo 1 - Básico',
    'Módulo 2 - Intermediário',
    'Módulo 3 - Avançado',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: _titles[_currentIndex],
        backgroundColor: _getAppBarColor(),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 8.0,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 11,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            activeIcon: Icon(Icons.school, size: 28),
            label: 'Módulo 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            activeIcon: Icon(Icons.code, size: 28),
            label: 'Módulo 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            activeIcon: Icon(Icons.star, size: 28),
            label: 'Módulo 3',
          ),
        ],
      ),
    );
  }

  Color _getAppBarColor() {
    switch (_currentIndex) {
      case 0:
        return Colors.green;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.purple;
      default:
        return Colors.blue;
    }
  }
}
