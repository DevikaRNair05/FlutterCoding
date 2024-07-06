import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'This is the About Us page.',
            style: TextStyle(fontSize: 24.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
