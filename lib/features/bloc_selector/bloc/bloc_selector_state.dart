class BlocSelectorState {

  String email;
  String emailError;

  BlocSelectorState({this.email = '', this.emailError = ''});

  BlocSelectorState copyWith({
    String? email, 
    String? emailError}) {
    return BlocSelectorState(
      email: email ?? this.email,
      emailError: emailError ?? this.emailError);
  }
}
