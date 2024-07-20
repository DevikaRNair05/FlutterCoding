import 'package:ecommerceapp/home_page.dart';
import 'package:ecommerceapp/payment_method_page.dart';
import 'package:ecommerceapp/settings_page.dart';
import 'package:ecommerceapp/shipping_address_page.dart';
import 'package:flutter/material.dart';
import 'aboutuspage.dart';
import 'add_payment_method_page.dart';
import 'checkout_page.dart';
import 'database_helper.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'forgot_password_page.dart';
import 'my_bag_page.dart';
import 'my_orders_page.dart';
import 'sign_up_page.dart';
import 'my_profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (!kIsWeb &&
  //     (defaultTargetPlatform == TargetPlatform.windows ||
  //         defaultTargetPlatform == TargetPlatform.linux ||
  //         defaultTargetPlatform == TargetPlatform.macOS)) {
  //   sqfliteFfiInit();
  //   databaseFactory = databaseFactoryFfi;
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/home': (context) => HomePage(),
        '/forgot_password': (context) => ForgotPasswordPage(),
        '/sign_up': (context) => SignUpPage(),
        '/my_profile': (context) => const ProfilePage(),
        '/shop': (context) => MyBagPage(),
        '/checkout': (context) => CheckoutPage(),
        '/myOrders': (context) => MyOrdersPage(),
        '/shipping_address': (context) => ShippingAddressPage(),
        '/login': (context) => LoginPage(),
        '/payment_methods': (context) => const PaymentMethodPage(),
        '/add_payment_method': (context) => const AddPaymentMethodPage(),
        '/settings': (context) => const SettingsPage(),
        '/about_us': (context) => const AboutUsPage(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  //initialize default value
  final TextEditingController emailController =
      TextEditingController(text: 'devikarajeesh05@gmail.com');
  final TextEditingController passwordController =
      TextEditingController(text: 'password123');

  final DatabaseHelper databaseHelper = DatabaseHelper();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Login to your account',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                // const SizedBox(height: 16.0),
                // const Text(
                //   'Login to your account',
                //   style: TextStyle(fontSize: 18.0),
                //   textAlign: TextAlign.center,
                // ),
                const SizedBox(height: 32.0),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () async {
// Initializing the TextEditingControllers with default values
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();

                    Map<String, dynamic>? user = {
                      'id': 1,
                      'email': 'devikarajeesh05@gmail.com',
                      'password': 'password123',
                    };

                    //Map<String, dynamic>? user =
                    //   await databaseHelper.getUser(email, password);

                    if (user != null) {
                      Navigator.pushNamed(
                        context,
                        '/home',
                        arguments: user,
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Invalid Credentials'),
                            content: const Text(
                                'Please check your email and password.'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Login now'),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle login with Google
                  },
                  icon: const Icon(Icons.g_translate),
                  label: const Text('Continue with Google'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgot_password');
                  },
                  child: const Text('Forgot Password?'),
                ),
                //const SizedBox(height: 16.0),
                // ElevatedButton(
                //   onPressed: () async {
                //     // Insert a user for testing purposes
                //     await databaseHelper.insertUser(
                //         'devikarajeesh05@gmail.com', 'password123');
                //     showDialog(
                //       context: context,
                //       builder: (BuildContext context) {
                //         return AlertDialog(
                //           title: const Text('User Inserted'),
                //           content: const Text('A test user has been inserted.'),
                //           actions: <Widget>[
                //             TextButton(
                //               child: const Text('OK'),
                //               onPressed: () {
                //                 Navigator.of(context).pop();
                //               },
                //             ),
                //           ],
                //         );
                //       },
                //     );
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.blue,
                //   ),
                //   child: const Text('Insert Test User'),
                // ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign_up');
                  },
                  child: const Text('Don\'t have an account? Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
