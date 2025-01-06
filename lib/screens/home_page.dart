import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    'https://phenikaa-uni.edu.vn/assets/images/phenikaauniversity.png',
                    height: 60,
                  ),
                  const SizedBox(width: 16),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=3',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'What comes around will turn around!',
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
          ),
          const Text(
            'quanli',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
