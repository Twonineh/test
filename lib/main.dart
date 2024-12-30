import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 2; // Set the default count to 2

  final List<dynamic> items = [1, "hello", 2, "goodbye"]; // List to display items

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: const Text(
          'Flutter Demo Home Page',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '$counter',
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Hello',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '$items',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                buildColoredBox(Colors.red, "Red"),
                buildColoredBox(Colors.green, "Green"),
                buildColoredBox(Colors.blue, "Blue"),
                buildColoredBox(Colors.cyan, "Cyan"),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        backgroundColor: Colors.purple[100],
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }

  Widget buildColoredBox(Color color, String label) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      width: 100,
      height: 100,
      color: color,
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    );
  }
}
