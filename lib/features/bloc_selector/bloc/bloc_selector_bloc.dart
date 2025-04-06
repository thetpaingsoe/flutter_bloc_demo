
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_selector_event.dart';
import 'bloc_selector_state.dart';

class BlocSelectorBloc extends Bloc<BlocSelectorEvent, BlocSelectorState> {
  BlocSelectorBloc() : super(BlocSelectorState()) {
    on<BlocSelectorEmailCheckedEvent>((event, emit){
      // check if email is valid
      _emailValidation(event.email)
          ? emit(BlocSelectorState(email: event.email, emailError: ""))
          : emit(BlocSelectorState(email: event.email, emailError: "Invalid Email"));
    });
  }

  bool _emailValidation(String email) {
    // simple regex for email validation
    final RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }
}