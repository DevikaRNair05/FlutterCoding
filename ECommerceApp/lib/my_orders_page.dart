import 'package:ecommerceapp/footer_page.dart';
import 'package:flutter/material.dart';
import 'database_helper.dart';

class MyOrdersPage extends StatefulWidget {
  MyOrdersPage({super.key});

  @override
  _MyOrdersPageState createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  final DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: databaseHelper.getOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading orders'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No orders found'));
          } else {
            final orders = snapshot.data!;
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return ListTile(
                  title: Text('Order #${order['orderId']}'),
                  subtitle: Text('Total: \$${order['total']}'),
                  trailing: Text('Status: ${order['status']}'),
                  onTap: () {
                    // Navigate to order details if needed
                  },
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar:
          FooterPage(currentIndex: 2), // Adjust index accordingly
    );
  }
}
