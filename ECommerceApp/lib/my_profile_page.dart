import 'package:ecommerceapp/footer_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  // backgroundImage: NetworkImage(
                  //     'https://example.com/avatar.jpg'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Devika R Nair',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('devikarajeesh05@gmail.com'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildProfileItem(
              'My orders',
              '',
              onTap: () {
                Navigator.pushNamed(context, '/myOrders');
              },
            ),
            _buildProfileItem(
              'Shipping addresses',
              '',
              onTap: () {
                Navigator.pushNamed(context, '/shipping_address');
              },
            ),
            _buildProfileItem(
              'Payment methods',
              '',
              onTap: () {
                Navigator.pushNamed(context, '/payment_methods');
              },
            ),
            _buildProfileItem(
              'Settings',
              '',
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          FooterPage(currentIndex: 2), // Use the custom bottom navigation bar
    );
  }

  Widget _buildProfileItem(String title, String subtitle,
      {VoidCallback? onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: const TextStyle(fontSize: 16)),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }
}
