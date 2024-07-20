import 'package:ecommerceapp/footer_page.dart';
import 'package:flutter/material.dart';
import 'database_helper.dart';

class MyBagPage extends StatefulWidget {
  MyBagPage({super.key});

  @override
  _MyBagPageState createState() => _MyBagPageState();
}

class _MyBagPageState extends State<MyBagPage> {
  final DatabaseHelper databaseHelper = DatabaseHelper();

  double calculateTotal(List<Map<String, dynamic>> cartItems) {
    double total = 0.0;
    for (var item in cartItems) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Groceries'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: databaseHelper.getCartItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading cart items'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Your bag is empty'));
          } else {
            final cartItems = snapshot.data!;
            final totalAmount = calculateTotal(cartItems);
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return ListTile(
                        title: Text(item['productName']),
                        subtitle: Text('Price: ₹${item['price']} per kg'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () async {
                                if (item['quantity'] > 1) {
                                  await databaseHelper.updateCartItemQuantity(
                                    item['id'],
                                    item['quantity'] - 1,
                                  );
                                  setState(() {});
                                }
                              },
                            ),
                            Text('${item['quantity']}'),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () async {
                                await databaseHelper.updateCartItemQuantity(
                                  item['id'],
                                  item['quantity'] + 1,
                                );
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Total Amount: \₹${totalAmount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/checkout');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Background color
                  ),
                  child: const Text('Checkout'),
                ),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: FooterPage(currentIndex: 2),
    );
  }
}
