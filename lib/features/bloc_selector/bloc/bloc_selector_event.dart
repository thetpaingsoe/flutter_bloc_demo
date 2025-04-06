sealed class BlocSelectorEvent {}

final class BlocSelectorEmailCheckedEvent extends BlocSelectorEvent {
  final String email;

  BlocSelectorEmailCheckedEvent(this.email);
}