import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedCategory = "Cake";
  int currentIndex = 2;

  final List<String> categories = ["Cake", "Donut", "Cookies", "Cupcake"];

  final List<Map<String, String>> allItems = [
    // Cake items
    {"title": "Special Strawberry with cherry Cake", "image": "assets/image/strawberry_cake.png", "category": "Cake"},
    {"title": "Chocolate with strawberry Cake", "image": "assets/image/choco_cake.png", "category": "Cake"},
    {"title": "Ube with blue berry Cake", "image": "assets/image/ube_cake.png", "category": "Cake"},
    {"title": "Cookies and Cream Cake", "image": "assets/image/cookies_cream_cake.png", "category": "Cake"},
    {"title": "White Chocolate with chocolate sprinkles Cake", "image": "assets/image/white_choco_sprinkle_cake.png", "category": "Cake"},
    {"title": "Rainbow Cake", "image": "assets/image/rainbow_cake.png", "category": "Cake"},
    {"title": "Vanilla Cake", "image": "assets/image/vanilla_cake.webp", "category": "Cake"},
    {"title": "Matcha with sprinkle Cake", "image": "assets/image/matcha_cake.png", "category": "Cake"},

    // Donut items
    {"title": "Lemon yeast with sprinkles Donut", "image": "assets/image/donut_lemon.png", "category": "Donut"},
    {"title": "Classic Chocolate with sprinkles Donut", "image": "assets/image/donut_choco.png", "category": "Donut"},
    {"title": "Blue berry with sprinkles Donut", "image": "assets/image/donut_blueberry.png", "category": "Donut"},
    {"title": "Strawberry with sprinkles Donut", "image": "assets/image/donut_strawberry.png", "category": "Donut"},
    {"title": "Vanilla with sprinkles Donut", "image": "assets/image/donut_vanilla.png", "category": "Donut"},
    {"title": "Caramel Donut", "image": "assets/image/donut_caramel.png", "category": "Donut"},
    {"title": "Matcha with Postacho Donut", "image": "assets/image/donut_matcha.png", "category": "Donut"},
    {"title": "Light pink glaze Donut", "image": "assets/image/donut_pink.png", "category": "Donut"},

    // Cookies items
    {"title": "Matcha Chocolate Chip Cookies", "image": "assets/image/cookies_matcha_chip.png", "category": "Cookies"},
    {"title": "Chocolate Crinkle Cookies", "image": "assets/image/cookies_crinkle.png", "category": "Cookies"},
    {"title": "Classic Butter Cookies", "image": "assets/image/cookies_butter.png", "category": "Cookies"},
    {"title": "Red Velvet Cookies with White Chocolate Chips", "image": "assets/image/cookies_red_velvet.png", "category": "Cookies"},
    {"title": "Blueberry-filled Cookies", "image": "assets/image/cookies_blueberry.png", "category": "Cookies"},
    {"title": "Black Cocoa Cookies with Candy Eyeballs", "image": "assets/image/cookies_black_cocoa.png", "category": "Cookies"},
    {"title": "Maamoul-style Cookies", "image": "assets/image/cookies_maamoul.png", "category": "Cookies"},
    {"title": "Cookie Monster Cookies", "image": "assets/image/cookies_monster.png", "category": "Cookies"},

    // Cupcake items
    {"title": "Vanilla buttercream frosting Cupcake", "image": "assets/image/cupcake_vanilla.webp", "category": "Cupcake"},
    {"title": "Valentine’s Day-themed chocolate Cupcake", "image": "assets/image/cupcake_valentine.png", "category": "Cupcake"},
    {"title": "Pastel-themed Vanilla Cupcake", "image": "assets/image/cupcake_pastel.png", "category": "Cupcake"},
    {"title": "Classic Chocolate Cupcake", "image": "assets/image/cupcake_chocolate.webp", "category": "Cupcake"},
    {"title": "Chocolate Blueberry Cupcake", "image": "assets/image/cupcake_blueberry.png", "category": "Cupcake"},
    {"title": "Black Cherry or Berry Sundae-inspired Cupcake", "image": "assets/image/cupcake_cherry_sundae.png", "category": "Cupcake"},
    {"title": "Oreo Cupcake", "image": "assets/image/cupcake_oreo.png", "category": "Cupcake"},
    {"title": "Caramel Cupcake", "image": "assets/image/cupcake_caramel.png", "category": "Cupcake"},
  ];

  List<Map<String, String>> get filteredItems =>
      allItems.where((item) => item["category"] == selectedCategory).toList();

  String getCategoryIcon(String category) {
    switch (category) {
      case "Cake":
        return "assets/image/cake.png";
      case "Donut":
        return "assets/image/donut.png";
      case "Cookies":
        return "assets/image/cookies.png";
      case "Cupcake":
        return "assets/image/cupcake.png";
      default:
        return "assets/image/cake.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F3FB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xFFFFD89C),
                    child: Icon(Icons.tune, color: Colors.black),
                  ),
                  const Spacer(),
                  Image.asset("assets/image/cake.png", height: 60),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                "What would your like to eat?",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search here....",
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search, color: Color(0xFFFFD89C)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Discover by category",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((category) {
                    final isSelected = category == selectedCategory;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFFFD89C) : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Image.asset(getCategoryIcon(category), height: 24),
                            const SizedBox(width: 6),
                            Text(category),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Popular $selectedCategory${selectedCategory.endsWith('s') ? '' : 's'}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: filteredItems.map((item) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Image.asset(item['image']!, height: 100, fit: BoxFit.contain),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              item['title']!,
                              style: const TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: const Color(0xFFFFD89C),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          if (index == 0) {
            Navigator.pushNamed(context, '/diary');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/weather');
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
    );
  }
}
