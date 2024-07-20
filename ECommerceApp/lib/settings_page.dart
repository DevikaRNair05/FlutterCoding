import 'package:ecommerceapp/footer_page.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSettingsItem(
              'Account Information',
              '',
              onTap: () {
                //Navigator.pushNamed(context, '/account_info');
              },
            ),
            _buildSettingsItem(
              'Privacy Settings',
              '',
              onTap: () {
                //Navigator.pushNamed(context, '/privacy_settings');
              },
            ),
            _buildSettingsItem(
              'Notification Preferences',
              '',
              onTap: () {
                //Navigator.pushNamed(context, '/notification_preferences');
              },
            ),
            _buildSettingsItem(
              'Language',
              '',
              onTap: () {
                //Navigator.pushNamed(context, '/language_settings');
              },
            ),
            _buildSettingsItem(
              'About Us',
              '',
              onTap: () {
                //Navigator.pushNamed(context, '/about_us');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          FooterPage(currentIndex: 0), // Use the custom bottom navigation bar
    );
  }

  Widget _buildSettingsItem(String title, String subtitle,
      {VoidCallback? onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: const TextStyle(fontSize: 16)),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }
}
