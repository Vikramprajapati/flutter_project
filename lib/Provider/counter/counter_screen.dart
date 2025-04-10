import 'package:flutter/material.dart';
import 'package:flutter_practical/Provider/counter/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  print("hello");
    return Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    // Provider.of<CounterProvider>(context, listen: false)
                    //     .decrease(); //by default listen in true

                    context.read<CounterProvider>().decrease();
                  },
                  child: Text("-")),
              Consumer(builder: (BuildContext cnt, value, Widget? child) {
                //here we use cnt replace of context to reduce conflict
                // print("hello1");
                return Text(
                    // "${Provider.of<CounterProvider>(cnt, listen: true).getCount()}");
                    "${cnt.watch<CounterProvider>().getCount()}"); //here we use cnt replace of context to reduce conflict
                // .watch() is used to get  data without using listen
              }),
              ElevatedButton(
                  onPressed: () {
                    // Provider.of<CounterProvider>(context, listen: false)
                    //     .increase();
                    context.read<CounterProvider>().increase();
                    // .read() is used to update  data without using listen
                  },
                  child: Text("+")),
            ],
          ),
        ));
  }
}
