import 'package:counter_7/page/drawer.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/page/Form/form.dart';
import 'package:counter_7/page/budget/show_list_budget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = 'Program Counter';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter(){
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: buildDrawer(context),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _counter % 2 == 0 ?
            const Text(
              'GENAP',
              style: TextStyle(color: Colors.red),
            ):
            const Text(
              'GANJIL',
              style: TextStyle(color: Colors.blue),
            ),

            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      
      floatingActionButton: Padding(padding: const EdgeInsets.only(left: 30),
        child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
        Visibility(
        visible: _counter > 0? true:false,
        child: FloatingActionButton(
          onPressed: _decrementCounter,
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ) , ), 
        
        // FloatingActionButton(
        //   onPressed: _counter > 0? (() => _decrementCounter()):() => {},
        //   tooltip: 'Decrement',
        //   child: const Icon(Icons.remove),
        // ),

        Expanded(child: Container()),
        FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ) ,
      ],),
      )
    );
  }
}
