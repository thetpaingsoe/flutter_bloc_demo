sealed class BasicCounterWithCubitState {
  final int counter;

  const BasicCounterWithCubitState({required this.counter});
}

final class BasicCounterWithCubitInitial extends BasicCounterWithCubitState {
  const BasicCounterWithCubitInitial(int counter) : super(counter: counter);
}
final class BasicCounterWithCubitIncremented extends BasicCounterWithCubitState {  
  const BasicCounterWithCubitIncremented(int counter) : super(counter: counter);
}
final class BasicCounterWithCubitDecreaed extends BasicCounterWithCubitState {
  const BasicCounterWithCubitDecreaed(int counter) : super(counter: counter);
}