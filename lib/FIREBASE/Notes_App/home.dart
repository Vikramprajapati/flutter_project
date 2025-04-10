import "package:firebase_database/firebase_database.dart";
import "package:firebase_database/ui/firebase_animated_list.dart";
import "package:flutter/material.dart";
import "package:flutter_practical/FIREBASE/Notes_App//add_user.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ref = FirebaseDatabase.instance.ref("Notes");
  final _searchControlller = TextEditingController();

  //delete user from firebase
  deleteUser(String id) {
    ref.child(id).remove().then(
      (value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Note Deleted Successfully",
                style: TextStyle(color: Colors.white)),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes App"),
        centerTitle: true,
      ),

      //TODO read data from firebase using FirebaseAnimatedList

      // body: Column(
      //   children: [
      //     Expanded(
      //       child: FirebaseAnimatedList(
      //         query: ref,
      //         itemBuilder: (context, snapshot, animation, index) {
      //           return Card(
      //             child: ListTile(
      //               leading: Text("${index + 1}"),
      //               title: Text(snapshot.child("name").value.toString()),
      //               subtitle: Text(snapshot.child("number").value.toString()),
      //               trailing: PopupMenuButton(
      //                 onSelected: (value) {
      //                   if (value == "edit") {
      //                     //  updateUser();
      //                   } else {
      //                     deleteUser(snapshot.child("id").value.toString());
      //                   }
      //                 },
      //                 itemBuilder: (context) => [
      //                   PopupMenuItem(
      //                     value: "edit",
      //                     child: Row(
      //                       children: [
      //                         Icon(Icons.edit, color: Colors.green),
      //                         SizedBox(width: 8),
      //                         Text('Edit'),
      //                       ],
      //                     ),
      //                   ),
      //                   PopupMenuItem(
      //                     value: "delete",
      //                     child: Row(
      //                       children: [
      //                         Icon(Icons.delete, color: Colors.red),
      //                         SizedBox(width: 8),
      //                         Text('Delete'),
      //                       ],
      //                     ),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           );
      //         },
      //       ),
      //     ),
      //   ],
      // ),

      //TODO read data from firebase using StreamBuilder

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _searchControlller,
              decoration: InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: StreamBuilder(
              stream: ref.onValue,
              builder: (context, snapshot) {
                if (!snapshot.hasData ||
                    snapshot.data!.snapshot.value == null) {
                  return Center(child: Text("No Notes Found"));
                }

                //TODO convert the value of map into list
                Map<dynamic, dynamic> map =
                    snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
                List<dynamic> notes = map.values.toList();
                return ListView.builder(
                  // itemCount: snapshot.data!.snapshot.children.length,
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    //used for filter
                    String title = notes[index]["title"];

                    if(_searchControlller.text.isEmpty) {
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(child: Text("${index + 1}")),
                          title: Text(notes[index]["title"]),
                          subtitle: Text(notes[index]["desc"]),
                          trailing: PopupMenuButton(
                            onSelected: (value) {
                              if (value == "edit") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddNote(
                                        note: notes[index],
                                      ),
                                    ));
                              } else {
                                deleteUser(notes[index]["id"]);
                              }
                            },
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: "edit",
                                child: Row(
                                  children: [
                                    Icon(Icons.edit, color: Colors.green),
                                    SizedBox(width: 8),
                                    Text('Edit'),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: "delete",
                                child: Row(
                                  children: [
                                    Icon(Icons.delete, color: Colors.red),
                                    SizedBox(width: 8),
                                    Text('Delete'),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    } else if (title
                        .toLowerCase()
                        .contains(_searchControlller.text.toLowerCase())) {
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(child: Text("${index + 1}")),
                          title: Text(notes[index]["title"]),
                          subtitle: Text(notes[index]["desc"]),
                          trailing: PopupMenuButton(
                            onSelected: (value) {
                              if (value == "edit") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddNote(
                                        note: notes[index],
                                      ),
                                    ));
                              } else {
                                deleteUser(notes[index]["id"]);
                              }
                            },
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: "edit",
                                child: Row(
                                  children: [
                                    Icon(Icons.edit, color: Colors.green),
                                    SizedBox(width: 8),
                                    Text('Edit'),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: "delete",
                                child: Row(
                                  children: [
                                    Icon(Icons.delete, color: Colors.red),
                                    SizedBox(width: 8),
                                    Text('Delete'),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNote(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
