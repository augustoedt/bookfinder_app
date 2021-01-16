import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Login'),
          const TextField(),
          const TextField(),
          RaisedButton(
            onPressed: (){},
            child: const Text('Sign In'),
          ),
          GestureDetector(
              onTap: (){},
              child: const Text("Don't have account?")
          )
        ],
      ),
    );
  }
}
