sealed class BuildWhenEvent {
  const BuildWhenEvent();
}

final class BuildWhenIncreaseEvent extends BuildWhenEvent {
  const BuildWhenIncreaseEvent();
}

final class BuildWhenDecreaseEvent extends BuildWhenEvent {
  const BuildWhenDecreaseEvent();
}