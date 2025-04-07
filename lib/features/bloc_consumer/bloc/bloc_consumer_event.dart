sealed class BlocConsumerEvent {}

final class BlocConsumerIncrementEvent extends BlocConsumerEvent {
  BlocConsumerIncrementEvent() : super();
}

final class BlocConsumerDecrementEvent extends BlocConsumerEvent {
  BlocConsumerDecrementEvent() : super();
}

final class BlocConsumerDumpEvent extends BlocConsumerEvent {
  BlocConsumerDumpEvent() : super();
}