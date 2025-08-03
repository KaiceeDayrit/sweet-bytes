import 'package:flutter/material.dart';

class Diary extends StatelessWidget {
  const Diary({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notes = [
      {
        'date': '07/01/25',
        'content':
        'Today was my first day back at school. I felt nervous but excited. I woke up early, got dressed, and made sure everything was ready — new bag, notebooks,.......',
        'color': '#F1FFB9'
      },
      {
        'date': '06/30/25',
        'content':
        'Today I spent most of my time in the kitchen. I cooked adobo for lunch — the smell of garlic and vinegar made the house feel warm and alive. It felt........',
        'color': '#FFE2B4'
      },
      {
        'date': '06/20/25',
        'content':
        'I spent my afternoon baking cookies today. The kitchen smelled like butter and chocolate — so comforting. I tried a new recipe and luckily, they........',
        'color': '#B9DBFF'
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF3F2FD),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFFFFD7A3),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          if (index == 2) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 4) {
            Navigator.pushNamed(context, '/profile');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/search', arguments: {
              'title': 'Search',
              'imagePath': 'assets/image/choco_cake.png'
            });
          } else if (index == 1) {
            // TODO: Add Weather screen
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Notes',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.sticky_note_2_outlined),
                ],
              ),
              const SizedBox(height: 10),
              const Chip(label: Text('All (3)')),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.8,
                  children: [
                    _addNoteTile(),
                    ...notes.map((note) => _noteTile(note)).toList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addNoteTile() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFB8A9A1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Icon(Icons.add, size: 40, color: Colors.black),
      ),
    );
  }

  Widget _noteTile(Map<String, String> note) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(_hexToColor(note['color']!)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(note['date']!,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              note['content']!,
              style: const TextStyle(fontSize: 13),
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }

  int _hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    return int.parse('FF$hex', radix: 16);
  }
}
