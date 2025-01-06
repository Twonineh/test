import 'package:flutter/material.dart';
import '../models/user.dart';
import 'home_page.dart';
import 'about_page.dart';
import 'contact_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<User> _users = [];

  final List<Widget> _screens = [
    const HomePage(),
    const AboutPage(),
    const ContactPage(),
  ];

  void generateSampleUsers() {
    _users.addAll([
      User(username: 'john_doe', password: 'password123', role: 'Admin'),
      User(username: 'jane_smith', password: 'password456', role: 'User'),
      User(username: 'alice_williams', password: 'password789', role: 'User'),
      User(username: 'bob_jones', password: 'password101', role: 'Admin'),
      User(username: 'charlie_brown', password: 'password202', role: 'User'),
    ]);
  }

  @override
  void initState() {
    super.initState();
    generateSampleUsers();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addUser(User user) {
    setState(() {
      _users.add(user);
    });
  }

  void _showAddUserDialog() {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController roleController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add User'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              TextField(
                controller: roleController,
                decoration: const InputDecoration(labelText: 'Role'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final user = User(
                  username: usernameController.text,
                  password: passwordController.text,
                  role: roleController.text,
                );
                _addUser(user);
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home Page'),
        backgroundColor: Colors.deepPurple[100],
      ),
      body: _selectedIndex == 0
          ? GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _users.length,
              itemBuilder: (BuildContext context, int index) {
                final user = _users[index];
                return Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Username: ${user.username}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Role: ${user.role}'),
                      ],
                    ),
                  ),
                );
              },
            )
          : _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page),
            label: 'Contact',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddUserDialog,
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),
    );
  }
}
