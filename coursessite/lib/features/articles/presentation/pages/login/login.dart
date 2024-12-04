import 'package:coursessite/core/auth/login/firabase_auth.dart';
import 'package:coursessite/core/auth/login/login_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Create a login stateful component using email using firebase auth
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Login'),
          leading:
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back))),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
              ),
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
              ),
            ),
            TextFormField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Confirm Password",
              ),
              validator: (value) {
                if (value != passwordController.text) {
                  return "Password does not match";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // CustomUser? user;
                    // CustomUser user;
                    // bool isUserLoggedIn = user.isUserLoggedIn();
                    FirebaseAuth auth = FirebaseAuth.instance;
                    // FirebaseAuthentication auth = FirebaseAuthentication(email: emailController.text, password: passwordController.text);
                      if(auth.currentUser != null) {
                        // url = '/course'; 
                        Navigator.pushNamed(context, '/course');
                      } else {
                        Navigator.pushNamed(context, '/login');
                      }
                  },
                  child: const Text("Sign Up"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
