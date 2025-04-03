import 'package:flutter/material.dart';
import 'features/basic_counter_with_bloc/ui/basic_counter_with_bloc_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 8, 1, 23)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Bloc Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 24,
            ),
            FilledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const BasicCounterWithBlocPage()));
                },
                child: Text('Basic Counter with Bloc')),
            SizedBox(
              height: 24,
            ),
            FilledButton(
              onPressed: () {},
              child: Text('Basic Counter with Cubit'),
            ),
            SizedBox(
              height: 24,
            ),
            FilledButton(onPressed: () {}, child: Text('Bloc Widgets'))
          ],
        ),
      ),
    );
  }
}
