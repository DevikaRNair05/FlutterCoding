import 'package:ecommerceapp/footer_page.dart';
import 'package:flutter/material.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Methods'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Saved Payment Methods',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildPaymentMethodItem(
              'Credit Card',
              '**** **** **** 1234',
              // Icons.credit_card,
              onTap: () {
                // Handle credit card tap
              },
            ),
            _buildPaymentMethodItem(
              'PayPal',
              'devikarajeesh05@gmail.com',
              // Icons.account_balance_wallet,
              onTap: () {
                // Handle PayPal tap
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add_payment_method');
              },
              child: const Text('Add New Payment Method'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FooterPage(currentIndex: 2),
    );
  }

  Widget _buildPaymentMethodItem(String title, String subtitle,
      {VoidCallback? onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: const TextStyle(fontSize: 16)),
      subtitle: Text(subtitle),
      // trailing: Icon(icon),
      onTap: onTap,
    );
  }
}
