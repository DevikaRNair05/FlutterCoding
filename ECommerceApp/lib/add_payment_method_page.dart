import 'package:flutter/material.dart';

import 'footer_page.dart';

class AddPaymentMethodPage extends StatefulWidget {
  const AddPaymentMethodPage({super.key});

  @override
  _AddPaymentMethodPageState createState() => _AddPaymentMethodPageState();
}

class _AddPaymentMethodPageState extends State<AddPaymentMethodPage> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController cardHolderNameController =
      TextEditingController();

  // Example function to validate input fields
  bool validateInput() {
    if (cardNumberController.text.isEmpty ||
        expiryDateController.text.isEmpty ||
        cvvController.text.isEmpty ||
        cardHolderNameController.text.isEmpty) {
      return false;
    }
    // You can add more specific validation here if needed
    return true;
  }

  // Example function to simulate saving payment method
  Future<void> savePaymentMethod() async {
    // Simulate a delay to mimic a network request
    await Future.delayed(const Duration(seconds: 2));
    // Print the details (you can replace this with your saving logic)
    print('Card Number: ${cardNumberController.text}');
    print('Expiry Date: ${expiryDateController.text}');
    print('CVV: ${cvvController.text}');
    print('Card Holder Name: ${cardHolderNameController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Payment Method'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter Payment Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: cardNumberController,
              decoration: const InputDecoration(
                labelText: 'Card Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: expiryDateController,
                    decoration: const InputDecoration(
                      labelText: 'Expiry Date (MM/YY)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: cvvController,
                    decoration: const InputDecoration(
                      labelText: 'CVV',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: cardHolderNameController,
              decoration: const InputDecoration(
                labelText: 'Card Holder Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (validateInput()) {
                  // Show loading indicator
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );

                  // Save payment method
                  await savePaymentMethod();

                  // Hide loading indicator
                  Navigator.of(context).pop();

                  // Show success message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Payment method saved successfully')),
                  );

                  // Clear input fields
                  cardNumberController.clear();
                  expiryDateController.clear();
                  cvvController.clear();
                  cardHolderNameController.clear();
                } else {
                  // Show error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill in all fields')),
                  );
                }
              },
              child: const Text('Save Payment Method'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FooterPage(currentIndex: 0),
    );
  }
}
