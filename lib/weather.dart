import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F2FD),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Weather tab is selected
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFFFFD7A3),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/diary');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/search', arguments: {
              'title': 'Search',
              'imagePath': 'assets/image/choco_cake.png'
            });
          } else if (index == 4) {
            Navigator.pushNamed(context, '/profile');
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/diaryy.png', height: 24), label: ''),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/cloudy-day.png', height: 24), label: ''),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/home.png', height: 24), label: ''),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/search.png', height: 24), label: ''),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/user.png', height: 24), label: ''),
        ],
      ),
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
