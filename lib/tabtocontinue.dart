import 'package:flutter/material.dart';

class TapToContinue extends StatelessWidget {
  const TapToContinue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDD9A0),
      body: GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/login');
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/image/logo.png', height: 150),
              const SizedBox(height: 20),
              const Text(
                'SweetBytes',
                style: TextStyle(fontSize: 36, fontFamily: 'Cursive'),
              ),
              const SizedBox(height: 60),
              const Text(
                'Click to Continue',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
