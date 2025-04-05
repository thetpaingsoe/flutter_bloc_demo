sealed class BuildWhenState {
  final int counter;

  const BuildWhenState({required this.counter});
}

final class BuildWhenInitial extends BuildWhenState {
  const BuildWhenInitial(int counter) : super(counter: counter);
}

final class BuildWhenIncreased extends BuildWhenState {
  const BuildWhenIncreased(int counter) : super(counter: counter);
}

final class BuildWhenDecreased extends BuildWhenState {
  const BuildWhenDecreased(int counter) : super(counter: counter);
}