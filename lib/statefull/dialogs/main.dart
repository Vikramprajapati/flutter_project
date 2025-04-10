import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  List<String> colorlist = ["Red", "Black", "Blue", "Orange"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Dialog'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  var status = await _showDialog(context);

                  if (status) {
                    print("log Out ");
                  } else {
                    print("still in the app");
                  }
                },
                child: Text("Alert Dialog")),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                String? color = await _showSimpleDialog(context);

                print("Selected Color:$color");
              },
              child: Text('Simple Dialog'),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: ()  {
                _showCustomDialog(context);
              },
              child: Text('Custom Dialog'),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _showDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Alert Dialog"),
        content: Text("Are you want to logout from this application?"),
        actions:[
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text('DELETE'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: Text('CANCEL'),
          )
        ],
      ),
    );
  }

  Future<String> _showSimpleDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => SimpleDialog(
          title: Text("Simple Dialog"),
          children: List.generate(
            colorlist.length,
            (index) => SimpleDialogOption(
              child: Text(colorlist[index]),
              onPressed: () {
                Navigator.pop(context, colorlist[index]);
              },
            ),
          )),
    );
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 16,
                top: 16 + 55,
              ),
              margin: EdgeInsets.only(top: 55),
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: const Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Success',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'It looks so simple, but it gets tricky when we try to make the circle peek out the card. The obvious widgets used in the image are,',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: Text('DONE'),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 0,
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}