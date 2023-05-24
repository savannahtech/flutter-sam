import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration:  InputDecoration(
                labelText: 'Password',
                errorText: _validate ? 'Password Can\'t Be Empty' : null,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                if (_passwordController.text.isEmpty) {
                  setState(() {
                _validate = true;
                  });
                }else{
                  setState(() {
                    _validate = false;
                  });
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

}
