import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Button"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  print("Text Button Clicked");
                },
                child: const Text("Text Button"),
              ),
              ElevatedButton(
                  onPressed: () {
                    print("Eleveted Button Clicked");
                  },
                  child: const Text("Eleveted Button")),
              OutlinedButton(
                  onPressed: () {
                    print("Outlined Button Clicked");
                  },
                  child: const Text("Outlined Button")),
              FloatingActionButton(
                onPressed: () {
                  print("Floating Action Button Clicked");
                },
                child: const Icon(Icons.add),
              )
            ],
          ),
        ),
      ),
    );
  }
}
