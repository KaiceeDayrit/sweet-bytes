import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedIndex = 4; // Index for 'user' icon

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    setState(() => _selectedIndex = index);

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/diary');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/weather');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/search', arguments: {
          'title': 'Search',
          'imagePath': 'assets/image/choco_cake.png',
        });
        break;
      case 4:
      // Already on Profile
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F2FD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Profile",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/image/kaicee.jpg"),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(Icons.edit, color: Colors.white, size: 18),
              ),
              const SizedBox(height: 10),
              const Text("SweetBytes",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              const Text("kaiceedayrit@gmail.com",
                  style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 25),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Inventories",
                    style: TextStyle(color: Colors.grey, fontSize: 13)),
              ),
              const SizedBox(height: 10),
              _buildTile(Icons.add_circle_outline, "My stories",
                  trailing: _buildBadge("5")),
              const SizedBox(height: 10),
              _buildTile(Icons.settings, "Setting"),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Preference",
                    style: TextStyle(color: Colors.grey, fontSize: 13)),
              ),
              const SizedBox(height: 10),
              _buildTile(Icons.notifications_none, "Push notification"),
              const SizedBox(height: 10),
              _buildTile(Icons.logout, "Logout",
                  iconColor: Colors.red, textColor: Colors.red),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFFFFD7A3),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/diaryy.png', height: 24),
              label: ''),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/cloudy-day.png', height: 24),
              label: ''),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/home.png', height: 24),
              label: ''),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/search.png', height: 24),
              label: ''),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/user.png', height: 24),
              label: ''),
        ],
      ),
    );
  }

  Widget _buildTile(IconData icon, String title,
      {Widget? trailing,
        Color iconColor = Colors.black,
        Color textColor = Colors.black}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFE0DFE4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 10),
          Expanded(child: Text(title, style: TextStyle(color: textColor))),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  Widget _buildBadge(String count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        count,
        style: const TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}
