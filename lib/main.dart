import 'package:flutter/material.dart';
import 'package:flutter_application_3/counter/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: const MyHomePage(title: 'Counter App'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/counter.jpg',
              width: 600.0,
              height: 240.0,
            ),
            const Text(
              'Current Count',
              style: TextStyle(
                  height: 6, fontSize: 30, fontWeight: FontWeight.bold),
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      backgroundColor: const Color.fromARGB(255, 255, 54, 54),
                      onPressed: () {
                        context.read<CounterBloc>().add(Decrement());
                      },
                      tooltip: 'Decrement',
                      child: const Icon(Icons.remove),
                    ),
                    Text(
                      '${state.count}',
                      style: const TextStyle(fontSize: 50),
                    ),
                    FloatingActionButton(
                      backgroundColor: const Color.fromARGB(255, 61, 123, 255),
                      onPressed: () {
                        context.read<CounterBloc>().add(Increment());
                      },
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
