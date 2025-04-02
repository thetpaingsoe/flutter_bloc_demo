sealed class BasicCounterWithBlocEvent {
  const BasicCounterWithBlocEvent();
}

final class BasicCounterWithBlocIncreaseEvent extends BasicCounterWithBlocEvent {
  const BasicCounterWithBlocIncreaseEvent();
}

final class BasicCounterWithBlocDecreaseEvent extends BasicCounterWithBlocEvent {
  const BasicCounterWithBlocDecreaseEvent();
}