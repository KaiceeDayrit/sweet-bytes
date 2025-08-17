import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final String title;
  final String imagePath;

  const SearchScreen({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 200),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                    (index) => Icon(Icons.star,
                    color: index < 4 ? Colors.orange : Colors.grey, size: 20),
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _InfoIcon(icon: Icons.local_fire_department, label: "180 Cal"),
                _InfoIcon(icon: Icons.access_time, label: "40-50 Min"),
                _InfoIcon(icon: Icons.scale, label: "3 kg"),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Description: Chocolate cake is a cake that uses strawberry as a primary ingredient. "
                  "Strawberries may be used in the cake batter, atop cakes and in chocolate cake’s frosting.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Flavor: Chocolate",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Ingredients:",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const _BulletList(items: [
              "1¾ cups (220g) all-purpose flour",
              "¾ cup (65g) unsweetened cocoa powder",
              "2 cups (400g) granulated sugar",
              "1½ tsp baking soda",
              "1½ tsp baking powder",
              "1 tsp salt",
              "2 eggs",
              "1 cup (240ml) buttermilk",
              "½ cup (120ml) vegetable oil",
              "2 tsp vanilla extract",
              "1 cup (240ml) hot water or coffee",
            ]),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Instructions:",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const _NumberedList(items: [
              "Preheat oven to 350°F (175°C). Grease and line two 8-inch round pans.",
              "In a large bowl, whisk dry ingredients.",
              "Add eggs, buttermilk, oil, and vanilla. Mix until smooth.",
              "Slowly mix in hot water or coffee.",
              "Pour batter into pans and bake 30–35 minutes.",
              "Let cool completely before assembling.",
            ]),
          ],
        ),
      ),
    );
  }
}

class _InfoIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.redAccent),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _BulletList extends StatelessWidget {
  final List<String> items;
  const _BulletList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((item) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Text("• $item",
            style: const TextStyle(fontSize: 13)),
      ))
          .toList(),
    );
  }
}

class _NumberedList extends StatelessWidget {
  final List<String> items;
  const _NumberedList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .asMap()
          .entries
          .map((entry) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Text("${entry.key + 1}. ${entry.value}",
            style: const TextStyle(fontSize: 13)),
      ))
          .toList(),
    );
  }
}
