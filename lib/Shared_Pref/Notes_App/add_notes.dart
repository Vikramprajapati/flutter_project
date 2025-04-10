import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class NotesService {
  static const String notesKey = "notes_list";

  // Save a new note (Title + Description)
  Future<void> addNote(String title, String description) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> notes = prefs.getStringList(notesKey) ?? [];

    Map<String, String> newNote = {
      "title": title,
      "description": description,
    };

    notes.add(jsonEncode(newNote));
    await prefs.setStringList(notesKey, notes);
  }

  // Get all notes
  Future<List<Map<String, String>>> getNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> notes = prefs.getStringList(notesKey) ?? [];

    return notes.map((note) => Map<String, String>.from(jsonDecode(note))).toList();
  }

  // Delete a note
  Future<void> deleteNote(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> notes = prefs.getStringList(notesKey) ?? [];

    if (index >= 0 && index < notes.length) {
      notes.removeAt(index);
      await prefs.setStringList(notesKey, notes);
    }
  }
}
