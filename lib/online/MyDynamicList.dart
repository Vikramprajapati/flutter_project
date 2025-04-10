import 'package:flutter/material.dart';

class MyDynamicList extends StatefulWidget {
  const MyDynamicList({super.key});

  @override
  State<MyDynamicList> createState() => _State();
}

class _State extends State<MyDynamicList> {
  List<String> mysubjectlist = [];

  int? editIndex = -1;
  final TextEditingController _subjectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Dynamic List'),
          backgroundColor: Colors.deepOrange,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _subjectController,
                decoration: InputDecoration(
                    hintText: "Enter Subject",
                    label: Text("Subject"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            editIndex! >= 0
                ? ElevatedButton(onPressed: () {
                  setState(() {
                    mysubjectlist[editIndex!]=_subjectController.text.toString();
                    editIndex=-1;
                  });
                  
                }, child: Text("Update"))
                : ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (mysubjectlist
                            .contains(_subjectController.text.toString())) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Already Exits.")));
                        } else {
                          mysubjectlist.add(_subjectController.text.toString());
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.green,
                              content: Text("Record Added.")));
                        }

                        _subjectController.clear();
                      });
                    },
                    child: Text("Save")),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: mysubjectlist.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: Colors.grey.shade200,
                    title: Text(mysubjectlist[index]),
                    trailing: Wrap(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              editIndex=index;
                              _subjectController.text=mysubjectlist[index];
                            });
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.green,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              mysubjectlist.removeAt(index);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Record Deleted.")));
                            });
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ))
          ],
        ));
  }
}
