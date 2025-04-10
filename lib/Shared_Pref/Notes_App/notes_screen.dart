import 'package:flutter/material.dart';
import 'package:flutter_practical/Shared_Pref/Notes_App/add_notes.dart';


class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final NotesService _notesService = NotesService();
  List<Map<String, String>> _notes = [];
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    List<Map<String, String>> notes = await _notesService.getNotes();
    setState(() {
      _notes = notes;
    });
  }

  Future<void> _addNote() async {
    if (_titleController.text.isNotEmpty && _descriptionController.text.isNotEmpty) {
      await _notesService.addNote(_titleController.text, _descriptionController.text);
      _titleController.clear();
      _descriptionController.clear();
      _loadNotes();
    }
  }

  Future<void> _deleteNote(int index) async {
    await _notesService.deleteNote(index);
    _loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes App')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _addNote,
                  child: Text('Add Note'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
              child: ListView.builder(
                itemCount: _notes.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: ListTile(
                      title: Text(_notes[index]['title'] ?? '', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                      subtitle: Text(_notes[index]['description'] ?? ''),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteNote(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
