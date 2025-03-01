import 'package:flutter/material.dart';
import '../unit_test/counter.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  Counter counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text('Unit Testing'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: Key('increment'),
              child: Icon(Icons.add),
              onPressed: () {
                // incrementCounter();
                counter.incrementCounter();
                setState(() {});
              }),
          SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            key: Key('decrement'),
            child: Icon(Icons.remove),
            onPressed: () {
              counter.decrementCounter();
              setState(() {});
            },
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height - 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const Text('You have to pushed the button this many times.', style: TextStyle(fontSize: 14, color: Colors.grey),),
            Text(
              counter.count.toString(),
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
