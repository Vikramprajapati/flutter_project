import 'package:flutter/material.dart';

class SnackbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SnackBar Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("This is a SnackBar!"),
                // backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                behavior: SnackBarBehavior.floating,
                action: SnackBarAction(
                  label: "Undo",
                  onPressed: () {
                    print("hello");
                  //  Navigator.pop(context);
                  },
                ),
              ),
            );
          },
          child: Text("Show SnackBar"),
        ),
      ),
    );
  }
}
