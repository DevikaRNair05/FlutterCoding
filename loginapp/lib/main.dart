import 'package:flutter/material.dart';
import 'aboutuspage.dart';
import 'database_helper.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/about': (context) => AboutUsPage(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Welcome back',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                Text(
                  'Login to your account',
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.0),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () async {
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();

                    Map<String, dynamic>? user =
                        await databaseHelper.getUser(email, password);

                    if (user != null) {
                      Navigator.pushNamed(context, '/about');
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Invalid Credentials'),
                            content: Text('Please check your email and password.'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('OK'),
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
                  child: Text('Login now'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle login with Google
                  },
                  icon: Icon(Icons.g_translate),
                  label: Text('Continue with Google'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                ),
                // SizedBox(height: 16.0),
                // ElevatedButton(
                //   onPressed: () async {
                //     // Insert a user for testing purposes
                //     await databaseHelper.insertUser('test1@example.com', 'password123');
                //     showDialog(
                //       context: context,
                //       builder: (BuildContext context) {
                //         return AlertDialog(
                //           title: Text('User Inserted'),
                //           content: Text('A test user has been inserted.'),
                //           actions: <Widget>[
                //             TextButton(
                //               child: Text('OK'),
                //               onPressed: () {
                //                 Navigator.of(context).pop();
                //               },
                //             ),
                //           ],
                //         );
                //       },
                //     );
                //   },
                //   child: Text('Insert Test User'),
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.blue,
                //   ),
                //),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
