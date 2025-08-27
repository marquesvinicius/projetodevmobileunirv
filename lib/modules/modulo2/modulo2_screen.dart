import 'package:flutter/material.dart';

import 'widgets/formularios_tab.dart';
import 'widgets/layouts_tab.dart';
import 'widgets/navigation_tab.dart';

class Modulo2Screen extends StatelessWidget {
  const Modulo2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            color: Colors.blue.shade50,
            child: const TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blue,
              indicatorWeight: 3.0,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 13,
              ),
              tabs: [
                Tab(
                  icon: Icon(Icons.assignment),
                  text: 'Formulários',
                ),
                Tab(
                  icon: Icon(Icons.dashboard),
                  text: 'Layouts',
                ),
                Tab(
                  icon: Icon(Icons.navigation),
                  text: 'Navegação',
                ),
              ],
            ),
          ),
          const Expanded(
            child: TabBarView(
              children: [
                FormulariosTab(),
                LayoutsTab(),
                NavigationTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
