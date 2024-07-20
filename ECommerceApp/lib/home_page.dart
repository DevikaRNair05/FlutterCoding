import 'package:flutter/material.dart';
import 'footer_page.dart';
import 'main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.green,
      ),
      home: const HomePage(),
      routes: {
        '/login': (context) => LoginPage(), // Add your LoginPage route here
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          TextButton(
            onPressed: () {
              // Handle logout
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.brown),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'E-Commerce Application',
              style: TextStyle(fontSize: 24, backgroundColor: Colors.yellow),
            ),
            // const SizedBox(height: 20),
            // Image.asset(
            //   'assets/images/home_page.jpg', // Image path
            //   width: 200,
            //   height: 200,
            // ),
          ],
        ),
      ),
      bottomNavigationBar: FooterPage(currentIndex: 2),
    );
  }
}
