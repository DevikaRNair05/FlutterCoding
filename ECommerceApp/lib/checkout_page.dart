import 'package:flutter/material.dart';

import 'footer_page.dart';
import 'payment_success_page.dart';

class CheckoutPage extends StatelessWidget {
  CheckoutPage({super.key});

  // Replace these with actual data fetching logic
  final String savedAddress = "123 Main St, Springfield, USA";
  final String savedPaymentMethod = "**** **** **** 1234";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Shipping Address',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              savedAddress,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Payment Method',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              savedPaymentMethod,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Handle payment processing
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentSuccessPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Place Order'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FooterPage(currentIndex: 2),
    );
  }
}
