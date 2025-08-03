import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  final String nextRoute;

  const LoadingScreen({super.key, required this.nextRoute});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, widget.nextRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDD9A0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/image/logo.png', height: 120),
            const SizedBox(height: 20),
            const Text(
              'SweetBytes',
              style: TextStyle(fontSize: 36, fontFamily: 'Cursive'),
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(color: Colors.black87),
          ],
        ),
      ),
    );
  }
}
