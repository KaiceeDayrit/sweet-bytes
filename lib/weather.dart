import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              _buildWeatherCard('assets/image/sunny.png', 'Sunny Day', const Color(0xFFF1FFB9)),
              const SizedBox(height: 20),
              _buildWeatherCard('assets/image/rainy.png', 'Rainy Day', const Color(0xFFB9DBFF)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherCard(String imagePath, String label, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Image.asset(imagePath, height: 100),
          const SizedBox(height: 10),
          Text(label,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
