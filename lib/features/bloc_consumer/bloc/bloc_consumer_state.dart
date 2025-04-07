class BlocConsumerState {
  int counter;
  BlocConsumerState({this.counter = 0});

  BlocConsumerState copyWith({int? counter}) {
    return BlocConsumerState(counter: counter ?? this.counter);
  }
}

final class BlocConsumerDumpState extends BlocConsumerState {
  BlocConsumerDumpState({required super.counter});
}