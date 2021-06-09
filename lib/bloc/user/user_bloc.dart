import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kelemapp/api/flutterfire.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    if (FirebaseAuth.instance.currentUser != null) {
      emitSignedIn();
    } else {
      emitSignedOut();
    }
  }
  void emitSignedIn() => emit(UserSignedInState());
  void emitSignedOut() => emit(UserSignedOutState());
  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is UserSignIn) {
      yield UserSignedInState();
    } else if (event is UserSignOut) {
      yield UserInitial();
      final result = await signOut();
      if (result) {
        yield UserSignedOutState();
      } else {
        yield UserSigningOutErrorState();
      }
    }
  }
}
