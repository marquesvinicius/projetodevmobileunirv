import 'package:flutter/material.dart';

class LayoutsTab extends StatelessWidget {
  const LayoutsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade50,
            Colors.blue.shade100,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.dashboard,
                      size: 48,
                      color: Colors.blue,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Layouts Responsivos',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Design adaptável para diferentes telas',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.2,
                children: [
                  _buildLayoutCard(
                    'Grid Layout',
                    Icons.grid_view,
                    Colors.green,
                    () => _showLayoutDemo(context, 'Grid Layout'),
                  ),
                  _buildLayoutCard(
                    'Flex Layout',
                    Icons.view_column,
                    Colors.orange,
                    () => _showLayoutDemo(context, 'Flex Layout'),
                  ),
                  _buildLayoutCard(
                    'Stack Layout',
                    Icons.layers,
                    Colors.purple,
                    () => _showLayoutDemo(context, 'Stack Layout'),
                  ),
                  _buildLayoutCard(
                    'Wrap Layout',
                    Icons.wrap_text,
                    Colors.teal,
                    () => _showLayoutDemo(context, 'Wrap Layout'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLayoutCard(
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.1),
                color.withOpacity(0.2),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: color,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLayoutDemo(BuildContext context, String layoutType) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(layoutType),
        content: SizedBox(
          width: 300,
          height: 200,
          child: _buildLayoutExample(layoutType),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  Widget _buildLayoutExample(String layoutType) {
    switch (layoutType) {
      case 'Grid Layout':
        return GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          children: List.generate(
            9,
            (index) => Container(
              color: Colors.blue.shade100,
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        );
      case 'Flex Layout':
        return Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.orange.shade100,
                child: const Center(child: Text('Flex: 2')),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.orange.shade200,
                child: const Center(child: Text('Flex: 1')),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.orange.shade300,
                child: const Center(child: Text('Flex: 3')),
              ),
            ),
          ],
        );
      case 'Stack Layout':
        return Stack(
          children: [
            Container(
              color: Colors.purple.shade100,
              child: const Center(child: Text('Background')),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.purple.shade300,
                child: const Text('Positioned'),
              ),
            ),
            const Positioned(
              bottom: 20,
              left: 20,
              child: Icon(
                Icons.star,
                color: Colors.purple,
                size: 30,
              ),
            ),
          ],
        );
      default:
        return Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(
            10,
            (index) => Chip(
              label: Text('Item ${index + 1}'),
              backgroundColor: Colors.teal.shade100,
            ),
          ),
        );
    }
  }
}
