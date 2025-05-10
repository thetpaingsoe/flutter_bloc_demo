import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/features/basic_counter_with_cubit/ui/basic_counter_with_cubit_page.dart';
import 'package:flutter_bloc_demo/features/bloc_consumer/ui/bloc_consumer_page.dart';
import 'package:flutter_bloc_demo/features/bloc_selector/ui/bloc_selector_page.dart';
import 'package:flutter_bloc_demo/features/concrete_class_state/ui/concrete_class_page.dart';
import 'package:flutter_bloc_demo/features/repository_provider/ui/repository_provider_page.dart';
import 'package:flutter_bloc_demo/features/sealed_class_state/ui/sealed_class_page.dart';
import 'package:flutter_bloc_demo/features/share_repository/features/dashboard/ui/dashboard_page.dart';
import 'common/widgets/filled_button_action_widget.dart';
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
  final uiList = [
    {
      'name': 'Basic Counter with Bloc',
      'action': const BasicCounterWithBlocPage(),
    },
    {
      'name': 'Basic Counter with Cubit',
      'action': const BasicCounterWithCubitPage(),
    },
    {
      'name': 'BlocBuilder : BuildWhen',
      'action': const BuildWhenPage(),
    },
    {
      'name': 'BlocSelector',
      'action': const BlocSelectorPage(),
    },
    {
      'name': 'BlocConsumer',
      'action': const BlocConsumerPage(),
    },
    {
      'name': 'Simple RepositoryProvider',
      'action': const RepositoryProviderPage(),
    },
    {
      'name': 'States : Concrete Class State',
      'action': const ConcreteClassPage(),
    },
    {
      'name': 'States : Sealed Class State',
      'action': const SealedClassPage(),
    },
    {
      'name': 'States : Hybird Sealed Class State',
      'action': const HybirdSealedClassPage(),
    },
    {
      'name': 'Shared Repository',
      'action': const ShareRepositoryPage(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemCount: uiList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                child: FilledButtonActionWidget(
                  title: uiList[index]['name'].toString(),
                  action: () => uiList[index]['action'],
                ),
              ),
            );
          },
        ));
  }
}
