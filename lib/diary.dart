import 'package:flutter/material.dart';

class Diary extends StatefulWidget {
  const Diary({super.key});

  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  final List<Map<String, String>> notes = [
    {
      'date': '07/01/25',
      'content': 'Today was my first day back at school. I felt nervous but excited. I woke up early, got dressed, and made sure everything was ready...',
      'color': '#F1FFB9'
    },
    {
      'date': '06/30/25',
      'content': 'Today I spent most of my time in the kitchen. I cooked adobo for lunch — the smell of garlic and vinegar made the house feel warm...',
      'color': '#FFE2B4'
    },
    {
      'date': '06/20/25',
      'content': 'I spent my afternoon baking cookies today. The kitchen smelled like butter and chocolate — so comforting. I tried a new recipe...',
      'color': '#B9DBFF'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Chip(label: Text('All (3)')),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.8,
                  children: [
                    _addNoteTile(context),
                    ...notes.map((note) => _noteTile(context, note)).toList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addNoteTile(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final newNote = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => NoteEditor(),
          ),
        );

        if (newNote != null) {
          setState(() {
            notes.add(newNote);
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFB8A9A1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Icon(Icons.add, size: 40, color: Colors.black),
        ),
      ),
    );
  }

  Widget _noteTile(BuildContext context, Map<String, String> note) {
    return GestureDetector(
      onTap: () async {
        final updatedNote = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => NoteEditor(note: note),
          ),
        );

        if (updatedNote != null) {
          setState(() {
            final index = notes.indexOf(note);
            notes[index] = updatedNote;
          });
        }
      },
      child: Container(
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
      ),
    );
  }

  int _hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    return int.parse('FF$hex', radix: 16);
  }
}

class NoteEditor extends StatefulWidget {
  final Map<String, String>? note;

  const NoteEditor({super.key, this.note});

  @override
  State<NoteEditor> createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  late TextEditingController _dateController;
  late TextEditingController _contentController;
  late String _noteColor;

  @override
  void initState() {
    super.initState();
    _dateController =
        TextEditingController(text: widget.note?['date'] ?? '');
    _contentController =
        TextEditingController(text: widget.note?['content'] ?? '');
    _noteColor = widget.note?['color'] ?? '#F1FFB9'; // default yellow
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(widget.note == null ? 'New Note' : 'Edit Note'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              Navigator.pop(context, {
                'date': _dateController.text,
                'content': _contentController.text,
                'color': _noteColor,
              });
            },
          )
        ],
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(_hexToColor(_noteColor)),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _dateController,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'MM/DD/YY',
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: TextField(
                  controller: _contentController,
                  maxLines: null,
                  expands: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write your note here...',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  _colorOption('#F1FFB9'), // yellow
                  const SizedBox(width: 8),
                  _colorOption('#B9DBFF'), // blue
                  const SizedBox(width: 8),
                  _colorOption('#FFE2B4'), // orange
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _colorOption(String hexColor) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _noteColor = hexColor;
        });
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Color(_hexToColor(hexColor)),
          shape: BoxShape.circle,
          border: Border.all(
              color: _noteColor == hexColor ? Colors.black : Colors.transparent,
              width: 2),
        ),
      ),
    );
  }

  int _hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    return int.parse('FF$hex', radix: 16);
  }
}
