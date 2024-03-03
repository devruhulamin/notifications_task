import 'package:flutter/material.dart';
import 'package:notification_app/features/login/presentation/widgets/secure_text_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passwordController = SecureTextController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter Your Email: '),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passwordController,
              enableInteractiveSelection: false,
              obscureText: false,
              autocorrect: false,
              enableSuggestions: false,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your Password'),
            ),
          ],
        ),
      ),
    );
  }
}
