import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: DefaultTabController(
        length: 5,
        //initialIndex: 1,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Material App Bar'),
              centerTitle: true,
              bottom: TabBar(tabs: [
                Tab(
                  icon: Icon(Icons.music_note),
                ),
                Tab(
                  icon: Icon(Icons.music_video),
                ),
                Tab(
                  icon: Icon(Icons.camera_alt),
                ),
                Tab(
                  icon: Icon(Icons.grade),
                ),
                Tab(
                  icon: Icon(Icons.email),
                )
              ]),
            ),
            body: TabBarView(
              children: [
                Center(
                  child: Icon(
                    Icons.music_note,
                    size: 50,
                  ),
                ),
                Center(
                  child: Icon(
                    Icons.music_video,
                    size: 50,
                  ),
                ),
                Center(
                  child: Icon(
                    Icons.camera_alt,
                    size: 50,
                  ),
                ),
                Center(
                  child: Icon(
                    Icons.grade,
                    size: 50,
                  ),
                ),
                Center(
                  child: Icon(
                    Icons.email,
                    size: 50,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
