import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'URL Launcher',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('URL Launcher'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _makePhoneCall,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // Text color
              ),
              child: const Text('Make a Call'),
            ),
            const SizedBox(height: 20), // Add spacing between buttons
            ElevatedButton(
              onPressed: _visitWebsite,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // Text color
              ),
              child: const Text('Visit Website'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _makePhoneCall() async {
    const String phoneNumber = '+919544519440';
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $launchUri';
    }
  }

 // Method to visit a website
  Future<void> _visitWebsite() async {
    final Uri url = Uri.parse('https://flutter.dev/');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      // Handle the error when the URL cannot be launched
      throw 'Could not launch $url';
    }
  }

}
