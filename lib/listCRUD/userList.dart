import 'package:flutter/material.dart';
import 'package:flutter_practical/listCRUD/model/person.dart';
import 'package:uuid/uuid.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UseState();
}

class _UseState extends State<UserListScreen> {
  List<Person> personlist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView CRUD'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {

          }, icon: Icon(Icons.search)),
          Padding(padding: EdgeInsets.only(right: 10))
        ],
      ),
      body: ListView.builder(
        itemCount: personlist.length,
        itemBuilder: (context, index) {
          Person person = personlist[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.purple.shade200,
                child: Text(
                  "${person.name[0].toUpperCase()}",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                ),
              ),
              title: Text("${person.name}"),
              subtitle: Text("${person.email}\n${person.id}"),
              trailing: PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text("Edit"),
                    onTap: () async {
                      Person? p =
                          await _showModalBottomSheetDialog(context, person);

                      if (p != null) {
                        var index = personlist.indexWhere(
                          (element) => element.id == p.id,
                        );

                        if (index != -1) {
                          setState(() {
                            personlist[index] = p;
                          });
                        }
                      }
                    },
                  ),
                  PopupMenuItem(
                    child: Text("Delete"),
                    onTap: () {
                      _deleteRecord(context, person);
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var person = await _showModalBottomSheetDialog(context);
          if (person != null) {
            setState(() {
              personlist.insert(0, person);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<Person>? _showModalBottomSheetDialog(BuildContext context,
      [Person? person]) async {
    final _nameController =
        TextEditingController(text: person != null ? person.name : "");
    final _emailController =
        TextEditingController(text: person != null ? person.email : "");

    return await showModalBottomSheet(
      context: context,

      //to controlled scrolling like button also up when we start to writing something.
      isScrollControlled: true,

      builder: (context) => Container(
        color: Colors.white,
        padding: EdgeInsets.only(
            top: 24,
            left: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
            right: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                    label: Text("Enter Name"), border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                    label: Text("Enter Email"), border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                child: FilledButton(
                    style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: () {
                      String name = _nameController.text.trim();
                      String email = _emailController.text.trim();

                      Person p = Person(
                          id: person != null ? person.id : getUniqueId(),
                          name: name,
                          email: email);

                      Navigator.pop(context, p);
                    },
                    child: Text(person != null ? "Update" : "Insert ")),
              )
            ],
          ),
        ),
      ),
    );
  }

  String getUniqueId() {
    var uuid = Uuid();
    return uuid.v4();
  }

  void _deleteRecord(BuildContext context, Person person) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text(
              'Are you sure you want to delete this person (${person.name})?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("CANCEL")),
            TextButton(
                onPressed: () {
                  setState(() {
                    personlist
                        .removeWhere((element) => element.id == person.id);
                    Navigator.pop(context);
                  });
                },
                child: Text("DELETE"))
          ],
        );
      },
    );
  }
}
