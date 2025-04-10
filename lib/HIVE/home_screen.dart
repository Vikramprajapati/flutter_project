import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  late Box personsBox;
  int? _editingIndex;

  @override
  void initState() {
    super.initState();
    personsBox = Hive.box('personsBox');
  }

  // Add Person
  void _addPerson() {
    final name = _nameController.text.trim();
    final surname = _surnameController.text.trim();

    if (name.isNotEmpty && surname.isNotEmpty) {
      List<dynamic> personsList = personsBox.get('persons', defaultValue: []);
      personsList.add({'name': name, 'surname': surname});
      personsBox.put('persons', personsList);
      _nameController.clear();
      _surnameController.clear();
      setState(() {});
    }
  }

  // Delete Person
  void _deletePerson(int index) {
    List<dynamic> personsList = personsBox.get('persons', defaultValue: []);
    personsList.removeAt(index);
    personsBox.put('persons', personsList);
    setState(() {});
  }

  // Edit Person
  void _editPerson(int index) {
    List<dynamic> personsList = personsBox.get('persons', defaultValue: []);
    final name = _nameController.text.trim();
    final surname = _surnameController.text.trim();

    if (name.isNotEmpty && surname.isNotEmpty) {
      personsList[index] = {'name': name, 'surname': surname}; // Update value
      personsBox.put('persons', personsList);
      _nameController.clear();
      _surnameController.clear();
      _editingIndex = null; // Reset editing index
      setState(() {});
    }
  }

  // Show BottomSheet for Adding/Editing
  void _showBottomSheet({int? index}) {
    if (index != null) {
      // If editing, fill the text fields with existing data
      List<dynamic> personsList = personsBox.get('persons', defaultValue: []);
      final person = personsList[index];
      _nameController.text = person['name'];
      _surnameController.text = person['surname'];
      _editingIndex = index;
    } else {
      _nameController.clear();
      _surnameController.clear();
      _editingIndex = null;
    }

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Enter Name'),
              ),
              TextField(
                controller: _surnameController,
                decoration: InputDecoration(labelText: 'Enter Surname'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_editingIndex == null) {
                    _addPerson();
                  } else {
                    _editPerson(_editingIndex!);
                  }
                  Navigator.pop(context); // Close BottomSheet
                },
                child: Text(_editingIndex == null ? 'Add Person' : 'Update Person'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> personsList = personsBox.get('persons', defaultValue: []);

    return Scaffold(
      appBar: AppBar(title: Text('Hive List without Model')),
      body: ListView.builder(
        itemCount: personsList.length,
        itemBuilder: (context, index) {
          final person = personsList[index];

          return ListTile(
            title: Text(person['name']),
            subtitle: Text(person['surname']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => _showBottomSheet(index: index),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _deletePerson(index),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showBottomSheet(),
        child: Icon(Icons.add),
      ),
    );
  }
}
