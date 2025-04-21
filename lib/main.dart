import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/features/basic_counter_with_cubit/ui/basic_counter_with_cubit_page.dart';
import 'package:flutter_bloc_demo/features/bloc_consumer/ui/bloc_consumer_page.dart';
import 'package:flutter_bloc_demo/features/bloc_selector/ui/bloc_selector_page.dart';
import 'package:flutter_bloc_demo/features/concrete_class_state/ui/concrete_class_page.dart';
import 'package:flutter_bloc_demo/features/repository_provider/ui/repository_provider_page.dart';
import 'package:flutter_bloc_demo/features/sealed_class_state/ui/sealed_class_page.dart';
import 'package:flutter_bloc_demo/features/share_repository/features/dashboard/ui/dashboard_page.dart';
import 'features/basic_counter_with_bloc/ui/basic_counter_with_bloc_page.dart';
import 'features/bloc_builder_build_when/ui/build_when_page.dart';
import 'features/hybird_sealed_class_state/ui/hybird_sealed_class_page.dart';

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
              onPressed: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const BasicCounterWithCubitPage()));
              },
              child: Text('Basic Counter with Cubit'),
            ),
            SizedBox(
              height: 24,
            ),
            FilledButton(onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const BuildWhenPage()));
            }, child: Text('BlocBuilder : BuildWhen')),
            SizedBox(
              height: 24,
            ),
            FilledButton(onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const BlocSelectorPage()));
            }, child: Text('BlocSelector')),
            SizedBox(
              height: 24,
            ),
            FilledButton(onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const BlocConsumerPage()));
            }, child: Text('BlocConsumer')),
            SizedBox(
              height: 24,
            ),
            FilledButton(onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const RepositoryProviderPage()));
            }, child: Text('Simple RepositoryProvider')),
            SizedBox(
              height: 24,
            ),
            FilledButton(onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const ConcreteClassPage()));
            }, child: Text('States : Concrete Class State')),
            SizedBox(
              height: 24,
            ),
            FilledButton(onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SealedClassPage()));
            }, child: Text('States : Sealed Class State')),
            SizedBox(
              height: 24,
            ),
            FilledButton(onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const HybirdSealedClassPage()));
            }, child: Text('States : Hybird Sealed Class State')),
            const SizedBox(height : 24),
            FilledButton(onPressed: (){
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const ShareRepositoryPage()));
              }, 
              child: const Text('Shared Repository') )
          ],
        ),
      ),
    );
  }
}
