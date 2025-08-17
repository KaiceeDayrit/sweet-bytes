import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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

              // 👉 My stories tile
              _buildTile(
                Icons.add_circle_outline,
                "My stories",
                trailing: _buildBadge("5"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StoryScreen(),
                    ),
                  );
                },
              ),

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
              _buildTile(
                Icons.logout,
                "Logout",
                iconColor: Colors.red,
                textColor: Colors.red,
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable tile
  Widget _buildTile(
      IconData icon,
      String title, {
        Widget? trailing,
        Color iconColor = Colors.black,
        Color textColor = Colors.black,
        VoidCallback? onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }

  // Story count badge
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

// 👉 Story view screen (inside same file)
class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Stories")),
      body: Center(
        child: Image.asset("assets/image/story.jpg"), // Replace with your asset path
      ),
    );
  }
}
