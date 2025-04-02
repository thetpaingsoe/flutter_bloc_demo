
sealed class BasicCounterWithBlocState {
  final int counter;

  const BasicCounterWithBlocState({required this.counter});
}

final class BasicCounterWithBlocInitial extends BasicCounterWithBlocState {
  const BasicCounterWithBlocInitial(int counter) : super(counter: counter);
}
final class BasicCounterWithBlocIncremented extends BasicCounterWithBlocState {  
  const BasicCounterWithBlocIncremented(int counter) : super(counter: counter);
}
final class BasicCounterWithBlocDecreaed extends BasicCounterWithBlocState {
  const BasicCounterWithBlocDecreaed(int counter) : super(counter: counter);
}

