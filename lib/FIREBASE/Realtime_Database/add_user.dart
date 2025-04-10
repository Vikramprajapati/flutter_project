import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  Map<dynamic, dynamic>? user;

  AddNote({this.user});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _database = FirebaseDatabase.instance.ref("Notes");

  //add user into firebase
  addUser() {
    String id = _database
        .push()
        .key!;
    _database.child(id).set({
      "id": id,
      "title": _titleController.text.toString(),
      "desc": _descController.text.toString(),

    }).then(
          (value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Note Create Successfully",
                style: TextStyle(color: Colors.white)),
          ),
        );
        Navigator.pop(context);
        _titleController.clear();
        _descController.clear();

      },
    ).onError(
          (error, stackTrace) {},
    );
  }

  UpdateUser(String id) {
    _database.child(id).update({
      "title": _titleController.text.toString(),
      "desc": _descController.text.toString(),

    }).then(
          (value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("User Update Successfully",
                style: TextStyle(color: Colors.white)),
          ),
        );
        Navigator.pop(context);
        _titleController.clear();
        _descController.clear();

      },
    ).onError(
          (error, stackTrace) {},
    );
  }

  @override
  void initState() {
    _titleController.text = widget.user == null ? "" : widget.user!["title"];
    _descController.text = widget.user == null ? "" : widget.user!["desc"];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Realtime Database"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.user == null ? "Add Note" : "Update Note",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Form(
              key: _key,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "title field required";
                        }
                        return null;
                      },
                      controller: _titleController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: "Enter Title",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "desc. field required";
                        }
                        return null;
                      },
                      controller: _descController,
                      decoration: InputDecoration(
                          hintText: "Enter Description ",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),


                  ],
                ),
              )),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                if (_key.currentState!.validate()) {
                  widget.user == null
                      ? addUser()
                      : UpdateUser(widget.user!["id"]);
                }
              },
              child: Text(
                widget.user == null ? "Add Note" : "Update Note",
              ))
        ],
      ),
    );
  }
}
